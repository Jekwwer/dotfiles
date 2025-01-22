# dotfiles

This repository contains configuration files (`dotfiles`) and scripts for personalizing and automating my development environment. It includes advanced configurations and tools for streamlining workflows and improving productivity.

## Overview

This repository provides:

- **Bash Configuration** (`.bashrc`): Custom prompts, aliases, functions, and shell enhancements.
- **Editor Configuration** (`.editorconfig`): Enforces consistent coding styles for various file types.
- **Git Configuration** (`.gitattributes`, `.gitconfig`, `.gitignore_global`, `.gitmessage`): Standardized settings, improved workflows, and commit message templates.
- **Curl Configuration** (`.curlrc`): Enhanced `curl` settings for security, performance, and usability.
- **Wget Configuration** (`.wgetrc`): Enhanced `wget` settings for reliability, security, and convenience.
- **Scripts**:
  - **`scripts/commit-gen.py`**: A Python script for generating consistent, Conventional Commits-style messages interactively.
  - **`install.sh`**: A setup script for linking dotfiles, configuring dependencies, and preparing the environment.

## Disclaimer

All rights reserved. These dotfiles are provided for reference purposes only. 
Redistribution, modification, or reuse is not permitted without explicit permission from the author.

## Installation

1. Clone the repository into your Codespaces or local machine:

   ```bash
   git clone https://github.com/username/dotfiles.git ~/.dotfiles
   ```

2. Run the `install.sh` script:

   ```bash
   ~/.dotfiles/install.sh
   ```

   This script will:

   - Overwrite existing configuration files in your home directory:
     - `.bashrc`, `.gitconfig`, `.editorconfig`, `.gitattributes`, `.gitignore_global`, `.gitmessage`
   - Set up a Python virtual environment for tools and scripts.
   - Configure shell and Git settings for a streamlined workflow.

   **Note:** Overwriting ensures your custom configurations take precedence over any pre-existing files in the home directory.

3. Restart your terminal or apply the changes:
   ```bash
   source ~/.bashrc
   ```

## .bashrc

The `.bashrc` file configures how shell behaves and customizes command-line environment.

### Usage

1. Copy the `.bashrc` file to your home directory:
   ```bash
   cp ~/.dotfiles/.bashrc ~/.bashrc
   ```
2. Apply the changes:
   ```bash
   source ~/.bashrc
   ```

### Features List

This `.bashrc` configuration includes the following key components:

- **Core Configuration** for interactive shell checks, terminal title customization, and programmatic completion.
  - Includes the `core.excludesfile` setting to reference the global ignore file. Refer to the [`.gitignore_global`][.gitignore_global] section for setup instructions.
- **Aliases** for quick and easy command shortcuts.
- **Functions** to automate common or repetitive tasks.
- **Environment Variables** to set up a personalized working environment.
- **History Settings** to manage and streamline command history effectively.
- **Prompt Customization** for a visually informative shell prompt.
- **Shell Enhancements** for features like auto-correction, recursive globbing, and colored output.

#### **Core Configuration**

| Feature                      | Description                                        | Command/Setting                                                |
| ---------------------------- | -------------------------------------------------- | -------------------------------------------------------------- |
| Interactive Shell Check      | Ensures `.bashrc` runs only in interactive shells. | `case $- in *i*) ;; *) return;; esac`                          |
| Terminal Size Updates        | Updates `LINES` and `COLUMNS` dynamically.         | `shopt -s checkwinsize`                                        |
| Terminal Title Customization | Sets terminal title to `user@host:dir`.            | `case "$TERM" in xterm*\|rxvt*) ... esac`                      |
| Lesspipe Integration         | Enhances `less` for non-text files.                | `[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"` |
| Programmatic Completion      | Enables enhanced command-line completions.         | Loads from `/usr/share/bash-completion` if available.          |

#### **Aliases**

| Alias    | Description                                          | Exact Command                            |
| -------- | ---------------------------------------------------- | ---------------------------------------- |
| `ll`     | List files in long format including hidden files.    | `ls -la`                                 |
| `la`     | List all files, including hidden ones.               | `ls -A`                                  |
| `l`      | List files in compact format.                        | `ls -CF`                                 |
| `rm`     | Safer `rm` with confirmation before deletion.        | `rm -i`                                  |
| `mv`     | Safer `mv` with confirmation before overwriting.     | `mv -i`                                  |
| `cp`     | Safer `cp` with confirmation before overwriting.     | `cp -i`                                  |
| `..`     | Navigate to the parent directory.                    | `cd ..`                                  |
| `...`    | Navigate two levels up.                              | `cd ../..`                               |
| `....`   | Navigate three levels up.                            | `cd ../../..`                            |
| `gst`    | Display Git status.                                  | `git status`                             |
| `gco`    | Checkout a branch in Git.                            | `git checkout`                           |
| `gl`     | Show a concise, graphical Git log.                   | `git log --oneline --graph --decorate`   |
| `gca`    | Amend the last Git commit.                           | `git amend`                              |
| `gci`    | Commit changes in Git.                               | `git commit`                             |
| `gsci`   | Commit changes in Git using `scripts/commit-gen.py`. | `git smart-commit`                       |
| `gf`     | Fetch changes from the remote repository.            | `git fetch`                              |
| `gfi`    | Amend the last commit without changing the message.  | `git fixup`                              |
| `gpl`    | Pull changes from the remote repository.             | `git pull`                               |
| `gps`    | Push changes to the remote repository.               | `git push`                               |
| `gpf`    | Force push changes to the remote repository.         | `git push --force`                       |
| `update` | Update and upgrade system packages.                  | `sudo apt update && sudo apt upgrade -y` |
| `clr`    | Clear the terminal screen.                           | `clear`                                  |

#### **Functions**

| Function       | Description                                                          | Exact Command                                          |
| -------------- | -------------------------------------------------------------------- | ------------------------------------------------------ |
| `log [file]`   | Append a timestamped message to a log file (default: `logfile.txt`). | `echo "$(date +'%Y-%m-%d %H:%M:%S') $*" >> "$logfile"` |
| `hgrep [text]` | Search the command history for a specific keyword.                   | `history \| grep "$1"`                                 |
| `reload`       | Reload the `.bashrc` configuration without restarting the terminal.  | `source ~/.bashrc`                                     |

#### **Environment Variables**

| Variable | Description                                      | Value                              |
| -------- | ------------------------------------------------ | ---------------------------------- |
| `EDITOR` | Sets the default text editor.                    | `vim`                              |
| `VISUAL` | Sets the default visual editor.                  | `vim`                              |
| `PAGER`  | Sets the default text viewer.                    | `less`                             |
| `PATH`   | Adds user-specific binary directories to `PATH`. | `$HOME/bin:$HOME/.local/bin:$PATH` |
| `LANG`   | Sets language and locale.                        | `en_US.UTF-8`                      |
| `LC_ALL` | Enforces UTF-8 locale for all settings.          | `en_US.UTF-8`                      |

#### **History Settings**

| Setting          | Description                                            | Value                       |
| ---------------- | ------------------------------------------------------ | --------------------------- |
| `HISTSIZE`       | Maximum number of commands stored in history.          | `5000`                      |
| `HISTFILESIZE`   | Maximum number of commands stored in the history file. | `10000`                     |
| `HISTCONTROL`    | Ignores duplicates and space-prefixed commands.        | `ignoreboth`                |
| `HISTIGNORE`     | Excludes trivial commands from history.                | `ls:cd:cd -:pwd:exit:clear` |
| `PROMPT_COMMAND` | Automatically saves history after each command.        | `history -a`                |

#### **Prompt Customization**

| Feature           | Description                                       | Value                                                     |
| ----------------- | ------------------------------------------------- | --------------------------------------------------------- |
| Username/Hostname | Displays the username and hostname in the prompt. | `\[\e[1;32m\]\u@\h`                                       |
| Current Directory | Displays the current directory in the prompt.     | `\[\e[1;34m\]\w`                                          |
| Git Branch        | Displays the current Git branch in the prompt.    | `$(git branch 2>/dev/null \| grep '\*' \| sed 's/\* //')` |

#### **Shell Enhancements**

| Feature            | Description                                     | Command/Setting                                 |
| ------------------ | ----------------------------------------------- | ----------------------------------------------- |
| Auto-correction    | Corrects minor typos in directory names.        | `shopt -s dirspell`                             |
| Recursive Globbing | Allows searching through directories with `**`. | `shopt -s globstar`                             |
| Colorful Output    | Adds colors to `ls` and other commands.         | `CLICOLOR=1`, `LSCOLORS=GxFxCxDxBxegedabagaced` |
| Bash Completion    | Enables enhanced tab completion.                | `source /etc/bash_completion` if available.     |

## .curlrc

The `.curlrc` file provides a global configuration for the `curl` command-line tool, enhancing usability, security, and reliability for HTTP requests.

### Usage

1. Copy the `.curlrc` file to your home directory:
   ```bash
   cp ~/.dotfiles/.curlrc ~/.curlrc
   ```
2. The `.curlrc` file is automatically applied by `curl` when present in the home directory.

### Features List

- **Automatic Retries**: Retries failed requests up to 3 times on transient errors (`--retry 3`).
- **Timeouts**:
  - Connection timeout set to 15 seconds (`--connect-timeout 15`).
  - Maximum request time set to 120 seconds (`--max-time 120`).
- **Silent Mode with Error Reporting**: Suppresses unnecessary progress output but displays errors (`--silent`, `--show-error`).
- **Secure Connections**:
  - Enforces SSL/TLS usage (`--ssl`).
  - Ensures strong cryptographic protocols with secure ciphers (`--ciphers DEFAULT:@SECLEVEL=2`).
  - Verifies SSL certificates to prevent man-in-the-middle attacks.
- **Automatic Redirect Handling**: Follows HTTP redirects automatically (`--location`).
- **Default Output Handling**:
  - Prevents overwriting existing files by default (`--output /tmp/curl-output.txt`).
  - Avoids buffering for real-time responses (`--no-buffer`).
- **User-Agent Customization**: Sets a meaningful user-agent string based on the `curl` version (`--user-agent`).
- **Fail on HTTP Errors**: Stops processing on 4xx/5xx errors for better error handling in scripts (`--fail`).
- **IPv4 Fallback**: Ensures compatibility by preferring IPv4 if IPv6 is unavailable (`--ipv4`).

## .wgetrc

The `.wgetrc` file provides a global configuration for the `wget` command-line tool, enhancing usability, security, and reliability for file downloads and website mirroring.

### Usage

1. Copy the `.wgetrc` file to your home directory:
   ```bash
   cp ~/.dotfiles/.wgetrc ~/.wgetrc
   ```
2. The `.wgetrc` file is automatically applied by `wget` when present in the home directory.

### Features List

- **Retry Logic**: Retries failed downloads up to 3 times (`tries = 3`) for improved reliability.
- **Timeouts**:
  - DNS lookup timeout set to 10 seconds (`dns_timeout = 10`).
  - Read timeout set to 20 seconds (`read_timeout = 20`).
- **Recursive Downloads**:
  - Enables recursive downloads up to 5 levels deep (`recursive = on`, `level = 5`).
- **Resumable Downloads**: Automatically resumes partial downloads (`continue = on`).
- **Secure Connections**:
  - Enforces SSL/TLS usage and verifies certificates (`check_certificate = on`).
  - Uses trusted CA certificates from the system (`ca_directory = /etc/ssl/certs`).
- **Automatic Timestamping**: Prevents re-downloading unchanged files by checking modification times (`timestamping = on`).
- **User-Agent Customization**: Sets a meaningful user-agent string based on the `wget` version (`user_agent`).
- **Logging**: Logs all download activity to `~/wget-log.txt` for auditing and debugging purposes (`logfile = ~/wget-log.txt`).
- **Output Management**:
  - Specifies a default output file name (`output_document = wget-output.txt`).
  - Keeps downloads organized by defaulting to the `~/Downloads` directory (`dir_prefix = ~/Downloads`).

## .editorconfig

The `.editorconfig` file provides consistent coding style enforcement across various file types in my projects,
if a repository-specific .editorconfig file is not present.

### Usage

1. Copy the `.editorconfig` file to your home directory:
   ```bash
   cp ~/.dotfiles/.editorconfig ~/.editorconfig
   ```
2. Optionally, place a project-specific `.editorconfig` in the root of any repository where you need custom rules.
3. Supported by most modern text editors and IDEs out of the box. Check editor’s settings to ensure `.editorconfig` is enabled.

### Features List

- **Global Defaults**:

  - **Encoding**: UTF-8 for all files (`charset = utf-8`).
  - **Line Endings**: Unix-style newlines (`end_of_line = lf`).
  - **Indentation**: Default 2-space indentation (`indent_size = 2`, `indent_style = space`).
  - **Trailing Whitespace**: Automatically trims trailing whitespace (`trim_trailing_whitespace = true`).
  - **Final Newline**: Ensures files end with a newline (`insert_final_newline = true`).
  - **Line Length**: Restricts global line length to 88 characters (`max_line_length = 88`).

- **File-Specific Rules**:
  - **Configuration Files**:
    - Retains trailing whitespace for files like `.editorconfig` and `.gitignore` (`trim_trailing_whitespace = false`).
  - **Markdown Files**:
    - Increases max line length for readability (`max_line_length = 120`).
    - Preserves intentional trailing whitespace for line breaks (`trim_trailing_whitespace = false`).
  - **JSON Files**:
    - Enforces 2-space indentation, typical for JSON (`indent_size = 2`).
    - Removes line length restrictions (`max_line_length = off`).
  - **Python Files**:
    - Uses 4-space indentation to adhere to PEP 8 standards (`indent_size = 4`).
  - **Shell Scripts**:
    - Uses 4-space indentation for readability in shell scripts (`indent_size = 4`).
  - **Text and Log Files**:
    - Preserves trailing whitespace for compatibility with some tools (`trim_trailing_whitespace = false`).

## .gitattributes

The `.gitattributes` file configures how Git handles specific files and attributes. It ensures consistency, optimizes performance, and simplifies collaboration.

### Usage

1. Copy the `.gitattributes` file to the root of your repository:
   ```bash
   cp ~/.dotfiles/.gitattributes <repository_root>/.gitattributes
   ```
2. Stage and commit the file:
   ```bash
   git add .gitattributes
   git commit -m "Add .gitattributes for repository configuration"
   ```
3. Push the changes to the remote repository:
   ```bash
   git push
   ```

### Features List

- **Line Endings**: Normalizes text files with `* text=auto` and ensures LF endings for specific types (e.g., `.sh`, `.py`, `.json`).
- **Binary Files**: Marks files like images (`*.png`, `*.jpg`), fonts (`*.woff`, `*.ttf`), and archives (`*.zip`, `*.tar.gz`) as binary.
- **Merge Conflicts**: Enables `diff3` markers for better conflict resolution.
- **Custom Diffs**: Uses readable diffs for JSON and XML files.
- **Exclusions**: Ignores large files (`*.log`, `*.iso`) and temporary files (`*.tmp`, `.DS_Store`) from diffs and exports.
- **Language Stats**: Excludes generated files like `.min.js` from GitHub language statistics.
- **Locking**: Marks files like `*.lock` as lockable for collaboration.

## .gitconfig

The `.gitconfig` file configures various Git settings such as user information, aliases, and preferences for how Git should behave.

### Usage

1. Copy the `.gitconfig` file to your home directory:
   ```bash
   cp ~/.dotfiles/.gitconfig ~/.gitconfig
   ```
2. The `.gitconfig` file is automatically applied by Git when present in the home directory.

3. (Optional) Verify or edit the configuration:
   ```bash
   git config --global --edit
   ```

### Features List

This `.gitconfig` includes settings and configurations for:

- **Aliases**: Shortcuts for commonly used Git commands.
- **Color Settings**: Enables colored output for better command readability.
- **Commit Settings**: Adds features like commit templates and GPG signing.
- **Core Settings**: Configures editors, line endings, and global ignore files.
- **Credential Management**: Simplifies handling of credentials.
- **Diff and Merge Tools**: Uses `code` for visual comparison and conflict resolution.
- **Log and Format**: Enhances log readability with customized output and graphs.
- **Push and Pull Behavior**: Enforces safe and consistent workflows.
- **Rebase and Tag Settings**: Streamlines rebase operations and tag sorting.
- **User Settings**: Specifies the default author information for commits.

#### **Aliases**

| Alias          | Description                                                        | Command/Details                                                                                                   |
| -------------- | ------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------- |
| `amend`        | Amend the last commit.                                             | `commit --amend`                                                                                                  |
| `br`           | Show branches.                                                     | `branch`                                                                                                          |
| `ci`           | Commit changes.                                                    | `commit`                                                                                                          |
| `smart-commit` | Commit changes using a generated commit message from `commit-gen`. | See `.gitconfig`.                                                                                                 |
| `sci`          | Shortened version of `smart-commit`.                               | `smart-commit`                                                                                                    |
| `co`           | Switch branches or restore working tree files.                     | `checkout`                                                                                                        |
| `d`            | Show differences between commits or working tree.                  | `diff`                                                                                                            |
| `ds`           | Show differences in staged files.                                  | `diff --staged`                                                                                                   |
| `del-branch`   | Delete a remote branch.                                            | `push origin --delete <branch>`                                                                                   |
| `fixup`        | Amend the last commit without changing the message.                | `commit --amend --no-edit`                                                                                        |
| `lg`           | Show a concise log with graph and decorations.                     | `log --oneline --graph --decorate`                                                                                |
| `lga`          | Show all commits in a concise log with graph and decorations.      | `log --all --oneline --graph --decorate`                                                                          |
| `lgm`          | Show detailed log with graph, decorations, and commit body.        | `log --pretty=format:"%C(auto)%h %C(bold blue)%an %C(auto)%d %s%n%b%C(reset)" --graph --decorate --abbrev-commit` |
| `pushf`        | Force push safely with lease.                                      | `push --force-with-lease`                                                                                         |
| `ri`           | Interactive rebase.                                                | `rebase -i`                                                                                                       |
| `save`         | Save changes to stash.                                             | `stash save`                                                                                                      |
| `st`           | Show the working tree status.                                      | `status`                                                                                                          |
| `undo`         | Undo the last commit but keep the changes.                         | `reset HEAD~1`                                                                                                    |

#### **Color Settings**

| Feature | Description                             | Value  |
| ------- | --------------------------------------- | ------ |
| `ui`    | Enable colored output for Git commands. | `true` |

#### **Commit Settings**

| Feature    | Description                               | Value           |
| ---------- | ----------------------------------------- | --------------- |
| `gpgSign`  | Enable GPG signing for commits.           | `true`          |
| `template` | Specify the commit message template file. | `~/.gitmessage` |

#### **Core Settings**

| Feature        | Description                                              | Value                 |
| -------------- | -------------------------------------------------------- | --------------------- |
| `autocrlf`     | Normalize line endings for cross-platform compatibility. | `input`               |
| `editor`       | Set the default editor for Git commands.                 | `code --wait`         |
| `excludesfile` | Specify the global `.gitignore` file.                    | `~/.gitignore_global` |
| `pager`        | Set the pager for command output.                        | `less -RFX`           |

#### **Credential Settings**

| Feature  | Description                  | Value   |
| -------- | ---------------------------- | ------- |
| `helper` | Cache credentials for reuse. | `cache` |

#### **Diff Settings**

| Feature | Description                                      | Value                               |
| ------- | ------------------------------------------------ | ----------------------------------- |
| `tool`  | Set the default diff tool.                       | `code`                              |
| `cmd`   | Specify the command for `code` as the diff tool. | `code --wait --diff $LOCAL $REMOTE` |

#### **GitHub Settings**

| Feature | Description      | Value     |
| ------- | ---------------- | --------- |
| `user`  | GitHub username. | `jekwwer` |

#### **Initialization Settings**

| Feature         | Description                                       | Value  |
| --------------- | ------------------------------------------------- | ------ |
| `defaultBranch` | Set the default branch name for new repositories. | `main` |

#### **Log Settings**

| Feature        | Description                               | Value   |
| -------------- | ----------------------------------------- | ------- |
| `abbrevCommit` | Show abbreviated commit hashes in logs.   | `true`  |
| `decorate`     | Show references in logs.                  | `short` |
| `graph`        | Display logs with a graph representation. | `true`  |

#### **Format Settings**

| Feature  | Description                          | Value                                                                 |
| -------- | ------------------------------------ | --------------------------------------------------------------------- |
| `pretty` | Customize the format of log entries. | `format:%C(auto)%h %C(bold blue)%an %C(auto)%d %s %C(dim white)(%ar)` |

#### **Merge Settings**

| Feature         | Description                                       | Value                 |
| --------------- | ------------------------------------------------- | --------------------- |
| `conflictstyle` | Show conflicts in diff3 format.                   | `diff3`               |
| `tool`          | Set the default merge tool.                       | `code`                |
| `cmd`           | Specify the command for `code` as the merge tool. | `code --wait $MERGED` |

#### **Pull Settings**

| Feature  | Description                             | Value  |
| -------- | --------------------------------------- | ------ |
| `rebase` | Rebase instead of merging when pulling. | `true` |

#### **Push Settings**

| Feature   | Description                    | Value    |
| --------- | ------------------------------ | -------- |
| `default` | Set the default push behavior. | `simple` |

#### **Rebase Settings**

| Feature     | Description                                  | Value  |
| ----------- | -------------------------------------------- | ------ |
| `autoStash` | Automatically stash changes before rebasing. | `true` |

#### **Rerere Settings**

| Feature   | Description                                             | Value  |
| --------- | ------------------------------------------------------- | ------ |
| `enabled` | Enable "reuse recorded resolution" for merge conflicts. | `true` |

#### **Tag Settings**

| Feature | Description           | Value             |
| ------- | --------------------- | ----------------- |
| `sort`  | Sort tags by version. | `version:refname` |

#### **User Settings**

| Feature | Description                    | Value                          |
| ------- | ------------------------------ | ------------------------------ |
| `email` | Set the email for Git commits. | `evgenii.shiliaev@jekwwer.com` |
| `name`  | Set the name for Git commits.  | `Evgenii Shiliaev`             |

## .gitignore_global

The `.gitignore_global` file specifies files and directories that should be ignored by Git globally, across all repositories.
This prevents tracking of unnecessary or sensitive files, improving repository cleanliness and security.

### Usage

To apply the `.gitignore_global` file globally for all repositories:

1. Copy the file to your home directory:
   ```bash
   cp ~/.dotfiles/.gitignore_global ~/.gitignore_global
   ```
2. Configure Git to use the file globally:
   ```bash
   git config --global core.excludesfile ~/.gitignore_global
   ```

**Note:** Ensure your `.gitconfig` is set up correctly to recognize this global ignore file.
This is achieved through the `core.excludesfile` setting, which is already included in the `.gitconfig` file provided in this repository.

Refer to the [`.gitconfig`][.gitconfig] section for more details.

### Features List

This file is based on [github/gitignore/VisualStudio.gitignore][visualstudio.gitignore]
and [github/gitignore/Node.gitignore][node.gitignore], accumulating best practices and includes patterns for:

- **User-specific files**: Temporary editor files, settings, and logs.
- **Build directories**: `bin/`, `obj/`, and platform-specific folders like `x64/` and `x86/`.
- **Tool-specific files**: Files generated by Visual Studio, Xamarin, Node.js, Python, and others.
- **Temporary files**: Backup files, `.tmp` files, and cache directories.
- **Publish and deployment files**: Files created during Azure or web deployment.
- **Node.js-specific files**: Logs, runtime data, dependency directories (`node_modules/`, `jspm_packages/`, etc.), coverage data, cache files, and other Node.js-specific artifacts.

For a detailed list of ignored files and directories, refer to the `.gitignore_global` file in this repository.

## .gitmessage

The `.gitmessage` file defines a standardized commit message template to ensure consistency, clarity, and quality in commit messages.
This template is designed to align with best practices, follow the **Conventional Commits** standard, and provide essential details about changes.

### Template Structure

```plaintext
<type>(<scope>): <description>

<detailed description>

[FILES ADDED]
 - <list of newly added files>

[FILES MODIFIED]
 - <list of updated files>

[FILES REMOVED]
 - <list of removed files>

[DEPENDENCIES ADDED]
 - <list of newly added dependencies>

[DEPENDENCIES UPDATED]
 - <list of updated dependencies>

[DEPENDENCIES REMOVED]
 - <list of removed dependencies>

[FEATURES/CHANGES]
 - <list of new features, updates, or changes>

[TECHNIQUES]
 - <details about methods, tools, or approaches used>

[BREAKING CHANGE]
 - <description of breaking changes and user adaptation details>

[PURPOSE]
 - <reason for the change or issue being addressed>

[IMPACT]
 - <impact on the project, users, or performance>

[FIXES/CLOSES/RESOLVES]
 - #<list of related issue numbers>

[REFERENCES]
 - <links to documentation, code reviews, or other resources>
```

### Template Fields

- **`<type>`**: Specifies the type of change. Common types include:
  - `feat`: A new feature.
  - `fix`: A bug fix.
  - `docs`: Documentation changes.
  - `style`: Code formatting or styling changes without affecting functionality.
  - `refactor`: Code restructuring without changing functionality.
  - `perf`: Performance improvements.
  - `test`: Adding or updating tests.
  - `chore`: Maintenance tasks like updating dependencies or build processes.
  - `security`: Changes related to security, such as fixing vulnerabilities, adding input validation, or enhancing authentication mechanisms.
  - `deps`: Changes related to project dependencies, such as adding, updating, or removing libraries and modules.
- **`<scope>`**: Specifies the specific area of the codebase affected (optional).
- **`<description>`**: A concise, imperative summary of the change.
- **`<detailed description>`**: A more comprehensive explanation of the change (optional).
- **`[FILES ADDED/MODIFIED/REMOVED]`**: Lists the files affected by the commit.
- **`[DEPENDENCIES ADDED/UPDATED/REMOVED]`**: Highlights any dependency changes.
- **`[FEATURES/CHANGES]`**: Details the new features or changes made in the commit.
- **`[TECHNIQUES]`**: Describes tools, methods, or approaches used (optional).
- **`[BREAKING CHANGE]`**: Specifies breaking changes and required user actions.
- **`[PURPOSE]`**: Explains the rationale behind the change.
- **`[IMPACT]`**: Describes the effect on the project, users, or performance.
- **`[FIXES/CLOSES/RESOLVES]`**: References related issues, pull requests, or tasks.
- **`[REFERENCES]`**: Links to related documentation, code reviews, or designs (optional).

### Example Commit Message

```plaintext
feat(auth): add OAuth2 login support

Implemented OAuth2 login functionality, allowing users to authenticate with Google and GitHub.

[FILES ADDED]
 - src/auth/oauth2.js
 - src/auth/oauth2.test.js

[FILES MODIFIED]
 - src/auth/index.js

[DEPENDENCIES ADDED]
 - google-auth-library
 - @octokit/auth

[FEATURES/CHANGES]
 - Added OAuth2 authentication for Google and GitHub.
 - Improved error handling for authentication flows.

[PURPOSE]
 - Enhance security and provide seamless third-party login support.

[IMPACT]
 - Simplifies user authentication and improves overall security.

[FIXES]
 - #123

[REFERENCES]
 - OAuth2 Documentation: https://example.com/oauth2
```

### Usage

1. Copy the `.gitmessage` file to your home directory:
   ```bash
   cp ~/.dotfiles/.gitmessage ~/.gitmessage
   ```
2. Configure Git to use this file as the default commit message template:
   ```bash
   git config --global commit.template ~/.gitmessage
   ```

### Benefits

- Promotes clear, consistent, and descriptive commit messages.
- Simplifies collaboration by providing better context for changes.
- Enhances tracking and debugging with detailed commit history.
- Adheres to conventional commit message standards, aiding in automated workflows and versioning.

## scripts/commit-gen.py

The `commit-gen.py` script simplifies generating standardized commit messages for my projects.
It generates messages that follow the format outlined in the [`.gitmessage`][.gitmessage] section.

### Usage

The script is designed to be used primarily via the `git smart-commit` alias, and it is preconfigured in Codespaces through the `install.sh` script.

#### **Manual Usage**

To run the script manually:

1. Ensure you have Python installed and the necessary dependencies set up (configured via `install.sh`).
2. Execute the script from the `scripts/` directory or its installed location:
   ```bash
   python3 ~/.dotfiles/scripts/commit-gen.py
   ```
3. Follow the interactive prompt to create a commit message.

The generated message will be displayed, allowing you to paste it directly into your Git commit command or editor.

## install.sh

The `install.sh` script configures the development environment and installs dependencies.
It is designed to streamline the setup process for GitHub Codespaces primarily.

### Usage

To use the `install.sh` script:

1. Clone the repository into your Codespaces or local machine:

   ```bash
   git clone https://github.com/username/dotfiles.git ~/.dotfiles
   ```

2. Run the script:

   ```bash
   ~/.dotfiles/install.sh
   ```

3. Restart your terminal or apply the changes:
   ```bash
   source ~/.bashrc
   ```

### Features List

1. **Links Dotfiles**: The script symlinks key configuration files from the repository to the home directory. These files include:

   - `.bashrc`
   - `.curlrc`
   - `.gitattributes`
   - `.gitconfig`
   - `.gitignore_global`
   - `.gitmessage`

2. **Python Setup**:

   - Ensures Python 3 and `python3-venv` are installed.
   - Creates a virtual environment (`.venv`) in the repository if it doesn’t already exist.
   - Installs Python dependencies from `requirements.txt`.

3. **Script Linking**:

   - Links the `commit-gen.py` script to the `~/bin` directory for use via the `commit-gen` command.
   - Ensures the script is executable and accessible in your terminal.

4. **PATH Configuration**:
   - Ensures `~/bin` is included in the `PATH` environment variable.
   - Adds the necessary `export PATH="$HOME/bin:$PATH"` line to `.bashrc` if not already present.

### Notes

- The script assumes a Linux-based environment Codespaces setup.
- For details about the `commit-gen.py` script, refer to the [`scripts/commit-gen.py`][scripts/commit-gen.py] section.

[.gitconfig]: #gitconfig
[.gitignore_global]: #gitignore_global
[.gitmessage]: #gitmessage
[scripts/commit-gen.py]: #scriptscommit-genpy
[node.gitignore]: https://github.com/github/gitignore/blob/main/Node.gitignore
[visualstudio.gitignore]: https://github.com/github/gitignore/blob/main/VisualStudio.gitignore
