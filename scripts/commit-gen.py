#!/workspaces/.codespaces/.persistedshare/dotfiles/.venv/bin/python

# scripts/commit-gen.py:
# Generates a commit message based on user input and git diff using OpenAI's GPT.

import os
import subprocess
import tempfile
import sys
from openai import OpenAI

# Initialize the OpenAI client with your API key
client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))

def run_pre_commit_hooks():
    """
    Run git pre-commit hooks if available.
    """
    try:
        print("Running pre-commit hooks...")
        subprocess.run(["pre-commit", "run", "--all-files"], check=True)
        print("Pre-commit hooks executed successfully.")
    except FileNotFoundError:
        print("pre-commit is not installed or not configured.")
        return True  # Continue execution if pre-commit is not installed
    except subprocess.CalledProcessError:
        print("Pre-commit hooks failed. Exiting.")
        return False
    return True

def get_git_diff_staged():
    """
    Get the current `git diff --cached` output, including only staged changes.
    """
    try:
        # Get the diff for staged changes
        diff = subprocess.check_output(["git", "diff", "--cached"], text=True)
        if not diff.strip():
            print("No staged changes detected.")
            return None
        return diff
    except subprocess.CalledProcessError as e:
        print(f"Error while fetching staged git diff: {e}")
        return None

def generate_commit_message(user_message, git_diff):
    """
    Use the OpenAI API to generate a commit message based on the user's input and git diff.
    """
    # Construct the prompt for the assistant
    messages = [
        {
            "role": "system",
            "content": (
                "You are an expert assistant generating commit messages strictly adhering to the Conventional Commits "
                "standard. Instructions:"
                "\n\n"
                "1. Be straightforward, clear, and to the point.\n"
                "2. Use minimal but descriptive language to avoid losing crucial details.\n"
                "3. Follow this format:"
                "\n\n"
                "<type>(<scope>): <description>\n\n"
                "<detailed description>\n\n"
                "[FILES ADDED]\n - <list of added files>\n\n"
                "[FILES MODIFIED]\n - <list of modified files>\n\n"
                "[FILES REMOVED]\n - <list of removed files>\n\n"
                "[DEPENDENCIES ADDED]\n - <list of new dependencies>\n\n"
                "[DEPENDENCIES UPDATED]\n - <list of updated dependencies>\n\n"
                "[DEPENDENCIES REMOVED]\n - <list of removed dependencies>\n\n"
                "[FEATURES/CHANGES]\n - <list of new features, updates, or changes>\n\n"
                "[TECHNIQUES]\n - <details about methods, tools, or approaches used>\n\n"
                "[PURPOSE]\n - <reason for the change>\n\n"
                "[IMPACT]\n - <impact on the project, users, or performance>\n\n"
                "[FIXES/CLOSES/RESOLVES]\n - #<list of related issue numbers>\n\n"
                "[REFERENCES]\n - <links to related resources>\n\n"
                "4. Only for a breaking change, append a '!' to the <type> in the commit header (e.g., feat!: or fix!:).\n"
                "5. Only for a breaking change, In the commit body (within <detailed description>) include a separate line starting with "
                "'BREAKING CHANGE:' followed by the description of the breaking changes and any necessary adaptations."
            )
        },
        {
            "role": "user",
            "content": f"""
            Write a commit message based on the following inputs:

            User-provided description:
            "{user_message}"

            Git diff:
            ```
            {git_diff}
            ```
            Ensure the commit message is clear, concise, and includes all relevant sections. Use placeholders like
            '[FILES ADDED]' or '[FEATURES/CHANGES]' when specific details cannot be extracted from the diff.
            """
        }
    ]

    try:
        response = client.chat.completions.create(
            model="gpt-4o",  # Replace with your preferred model
            messages=messages
        )
        return response.choices[0].message.content
    except Exception as e:
        print(f"Error while generating commit message: {e}")
        return None

def write_to_file(content):
    """
    Write content to a temporary file and return the file path.
    """
    with tempfile.NamedTemporaryFile(delete=False, mode="w", prefix="commit_msg_", suffix=".txt") as temp_file:
        temp_file.write(content)
        return temp_file.name

def main():
    print("Welcome to the Commit Message Generator!")

    # Run pre-commit hooks
    if not run_pre_commit_hooks():
        sys.exit(1)

    # Get user input
    user_message = input("Enter a brief description of the changes: ").strip()
    if not user_message:
        print("A description is required. Exiting.")
        sys.exit(1)

    # Get git diff
    git_diff = get_git_diff_staged()
    if git_diff is None:
        print("No diff to analyze. Exiting.")
        sys.exit(1)

    # Generate commit message
    commit_message = generate_commit_message(user_message, git_diff)
    if not commit_message:
        print("Failed to generate a commit message. Exiting.")
        sys.exit(1)

    # Write commit message to a temporary file
    temp_file_path = write_to_file(commit_message)

    print("\nGenerated Commit Message:")
    print(commit_message)

    # Open git commit editor with the generated message
    try:
        subprocess.run(["git", "commit", "--file", temp_file_path, "--edit", "--no-verify"], check=True)
    except subprocess.CalledProcessError as e:
        print(f"Git commit failed: {e}")
    finally:
        # Clean up temporary file
        os.remove(temp_file_path)

if __name__ == "__main__":
    main()
