#!/workspaces/.codespaces/.persistedshare/dotfiles/.venv/bin/python

# scripts/commit-gen.py:
# Generates a commit message based on user input and git diff using OpenAI's GPT.

import os
from openai import OpenAI
import subprocess

# Initialize the OpenAI client with your API key
client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))

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
                "You are an expert assistant that generates commit messages strictly adhering to the Conventional "
                "Commits standard. Follow this format:"
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
                "[BREAKING CHANGE]\n - <description of breaking changes and user adaptation details>\n\n"
                "[PURPOSE]\n - <reason for the change>\n\n"
                "[IMPACT]\n - <impact on the project, users, or performance>\n\n"
                "[FIXES/CLOSES/RESOLVES]\n - #<list of related issue numbers>\n\n"
                "[REFERENCES]\n - <links to related resources>"
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

    # API call to OpenAI
    try:
        response = client.chat.completions.create(
            model="gpt-4o",  # Replace with the correct model if needed
            messages=messages
        )
        return response.choices[0].message.content
    except Exception as e:
        print(f"Error while generating commit message: {e}")
        return None

def main():
    print("Welcome to the Commit Message Generator!")

    # Get user input
    user_message = input("Enter a brief description of the changes: ").strip()
    if not user_message:
        print("A description is required. Exiting.")
        return

    # Get git diff
    git_diff = get_git_diff_staged()
    if git_diff is None:
        print("No diff to analyze. Exiting.")
        return

    # Generate commit message
    commit_message = generate_commit_message(user_message, git_diff)
    if commit_message:
        print("\nGenerated Commit Message:\n")
        print(commit_message)

if __name__ == "__main__":
    main()
