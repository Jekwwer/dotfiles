# dotfiles

This repository contains configuration files (`dotfiles`) for personalizing your development environment.
These dotfiles include advanced configurations for Bash (`.bashrc`), Git (`gitattributes`, `.gitconfig`, `.gitignore_global`, `gitmessage`)
ensuring a more productive, efficient, and user-friendly command-line experience.

## .bashrc

The `.bashrc` file included in this repository is an advanced shell configuration script designed to:
- **Streamline productivity** with aliases and functions for common tasks.
- **Enhance safety** by reducing accidental errors with safer defaults.
- **Customize the shell environment** with prompts, colors, and history management.
- **Add convenience** through auto-correction, recursive globbing, Git branch display, and dynamic terminal updates.

To use this `.bashrc`:
1. Copy it to your home directory:
   ```bash
   cp .bashrc ~/.bashrc
   ```
2. Apply the changes:
   ```bash
   source ~/.bashrc
   ```

### Complete Commands and Features List

This `.bashrc` configuration includes the following key components:
- **Core Configuration** for interactive shell checks, terminal title customization, and programmatic completion.
- **Aliases** for quick and easy command shortcuts.
- **Functions** to automate common or repetitive tasks.
- **Environment Variables** to set up a personalized working environment.
- **History Settings** to manage and streamline command history effectively.
- **Prompt Customization** for a visually informative shell prompt.
- **Shell Enhancements** for features like auto-correction, recursive globbing, and colored output.

Below is the complete breakdown of the commands, settings, and features available in this `.bashrc` configuration.

#### **Core Configuration**
| Feature                      | Description                                        | Command/Setting                                                |
| ---------------------------- | -------------------------------------------------- | -------------------------------------------------------------- |
| Interactive Shell Check      | Ensures `.bashrc` runs only in interactive shells. | `case $- in *i*) ;; *) return;; esac`                          |
| Terminal Size Updates        | Updates `LINES` and `COLUMNS` dynamically.         | `shopt -s checkwinsize`                                        |
| Terminal Title Customization | Sets terminal title to `user@host:dir`.            | `case "$TERM" in xterm*                                        | rxvt*) ... esac` |
| Lesspipe Integration         | Enhances `less` for non-text files.                | `[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"` |
| Programmatic Completion      | Enables enhanced command-line completions.         | Loads from `/usr/share/bash-completion` if available.          |

---

#### **Aliases**
| Alias    | Description                                         | Exact Command                            |
| -------- | --------------------------------------------------- | ---------------------------------------- |
| `ll`     | List files in long format including hidden files.   | `ls -la`                                 |
| `la`     | List all files, including hidden ones.              | `ls -A`                                  |
| `l`      | List files in compact format.                       | `ls -CF`                                 |
| `rm`     | Safer `rm` with confirmation before deletion.       | `rm -i`                                  |
| `mv`     | Safer `mv` with confirmation before overwriting.    | `mv -i`                                  |
| `cp`     | Safer `cp` with confirmation before overwriting.    | `cp -i`                                  |
| `..`     | Navigate to the parent directory.                   | `cd ..`                                  |
| `...`    | Navigate two levels up.                             | `cd ../..`                               |
| `....`   | Navigate three levels up.                           | `cd ../../..`                            |
| `gst`    | Display Git status.                                 | `git status`                             |
| `gco`    | Checkout a branch in Git.                           | `git checkout`                           |
| `gl`     | Show a concise, graphical Git log.                  | `git log --oneline --graph --decorate`   |
| `gca`    | Amend the last Git commit.                          | `git amend`                              |
| `gci`    | Commit changes in Git.                              | `git commit`                             |
| `gf`     | Fetch changes from the remote repository.           | `git fetch`                              |
| `gfi`    | Amend the last commit without changing the message. | `git fixup`                              |
| `gpl`    | Pull changes from the remote repository.            | `git pull`                               |
| `gps`    | Push changes to the remote repository.              | `git push`                               |
| `gpf`    | Force push changes to the remote repository.        | `git push --force`                       |
| `update` | Update and upgrade system packages.                 | `sudo apt update && sudo apt upgrade -y` |
| `clr`    | Clear the terminal screen.                          | `clear`                                  |

---

#### **Functions**
| Function       | Description                                                          | Exact Command                                          |
| -------------- | -------------------------------------------------------------------- | ------------------------------------------------------ |
| `log [file]`   | Append a timestamped message to a log file (default: `logfile.txt`). | `echo "$(date +'%Y-%m-%d %H:%M:%S') $*" >> "$logfile"` |
| `hgrep [text]` | Search the command history for a specific keyword.                   | `history                                               | grep "$1"` |
| `reload`       | Reload the `.bashrc` configuration without restarting the terminal.  | `source ~/.bashrc`                                     |

---

#### **Environment Variables**
| Variable | Description                                      | Value                              |
| -------- | ------------------------------------------------ | ---------------------------------- |
| `EDITOR` | Sets the default text editor.                    | `vim`                              |
| `VISUAL` | Sets the default visual editor.                  | `vim`                              |
| `PAGER`  | Sets the default text viewer.                    | `less`                             |
| `PATH`   | Adds user-specific binary directories to `PATH`. | `$HOME/bin:$HOME/.local/bin:$PATH` |
| `LANG`   | Sets language and locale.                        | `en_US.UTF-8`                      |
| `LC_ALL` | Enforces UTF-8 locale for all settings.          | `en_US.UTF-8`                      |

---

#### **History Settings**
| Setting          | Description                                            | Value                       |
| ---------------- | ------------------------------------------------------ | --------------------------- |
| `HISTSIZE`       | Maximum number of commands stored in history.          | `5000`                      |
| `HISTFILESIZE`   | Maximum number of commands stored in the history file. | `10000`                     |
| `HISTCONTROL`    | Ignores duplicates and space-prefixed commands.        | `ignoreboth`                |
| `HISTIGNORE`     | Excludes trivial commands from history.                | `ls:cd:cd -:pwd:exit:clear` |
| `PROMPT_COMMAND` | Automatically saves history after each command.        | `history -a`                |

---

#### **Prompt Customization**
| Feature           | Description                                       | Value                     |
| ----------------- | ------------------------------------------------- | ------------------------- |
| Username/Hostname | Displays the username and hostname in the prompt. | `\[\e[1;32m\]\u@\h`       |
| Current Directory | Displays the current directory in the prompt.     | `\[\e[1;34m\]\w`          |
| Git Branch        | Displays the current Git branch in the prompt.    | `$(git branch 2>/dev/null | grep '*' | sed 's/* //')` |

---

#### **Shell Enhancements**
| Feature            | Description                                     | Command/Setting                                 |
| ------------------ | ----------------------------------------------- | ----------------------------------------------- |
| Auto-correction    | Corrects minor typos in directory names.        | `shopt -s dirspell`                             |
| Recursive Globbing | Allows searching through directories with `**`. | `shopt -s globstar`                             |
| Colorful Output    | Adds colors to `ls` and other commands.         | `CLICOLOR=1`, `LSCOLORS=GxFxCxDxBxegedabagaced` |
| Bash Completion    | Enables enhanced tab completion.                | `source /etc/bash_completion` if available.     |

## .gitattributes

The `.gitattributes` file configures how Git handles specific files and attributes. It ensures consistency, optimizes performance, and simplifies collaboration.

### Key Features:
- **Line Endings**: Normalizes text files with `* text=auto` and ensures LF endings for specific types (e.g., `.sh`, `.py`, `.json`).
- **Binary Files**: Marks files like images (`*.png`, `*.jpg`), fonts (`*.woff`, `*.ttf`), and archives (`*.zip`, `*.tar.gz`) as binary.
- **Merge Conflicts**: Enables `diff3` markers for better conflict resolution.
- **Custom Diffs**: Uses readable diffs for JSON and XML files.
- **Exclusions**: Ignores large files (`*.log`, `*.iso`) and temporary files (`*.tmp`, `.DS_Store`) from diffs and exports.
- **Language Stats**: Excludes generated files like `.min.js` from GitHub language statistics.
- **Locking**: Marks files like `*.lock` as lockable for collaboration.

### Usage:
1. Add the `.gitattributes` file to your repository.
2. Commit it:
   ```bash
   git add .gitattributes
   git commit -m "Add .gitattributes for repository configuration"

## .gitconfig

The `.gitconfig` file in this repository is a comprehensive configuration for Git. It simplifies workflows, enforces best practices, and enhances the user experience with:
- **Aliases** for frequently used Git commands.
- **Color Settings** for better visibility of Git output.
- **Commit and Merge Settings** for consistency and streamlined conflict resolution.
- **Core and Credential Settings** to personalize and secure Git usage.
- **Log and Format Settings** for clear and concise commit history representation.

To apply this `.gitconfig`:
1. Copy it to your home directory:
   ```bash
   cp .gitconfig ~/.gitconfig

### Complete Features List

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
| Alias        | Description                                                   | Command/Details                                                                                                       |
| ------------ | ------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| `amend`      | Amend the last commit.                                        | `git commit --amend`                                                                                                  |
| `br`         | Show branches.                                                | `git branch`                                                                                                          |
| `ci`         | Commit changes.                                               | `git commit`                                                                                                          |
| `co`         | Switch branches or restore working tree files.                | `git checkout`                                                                                                        |
| `d`          | Show differences between commits or working tree.             | `git diff`                                                                                                            |
| `ds`         | Show differences in staged files.                             | `git diff --staged`                                                                                                   |
| `del-branch` | Delete a remote branch.                                       | `git push origin --delete <branch>`                                                                                   |
| `fixup`      | Amend the last commit without changing the message.           | `git commit --amend --no-edit`                                                                                        |
| `lg`         | Show a concise log with graph and decorations.                | `git log --oneline --graph --decorate`                                                                                |
| `lga`        | Show all commits in a concise log with graph and decorations. | `git log --all --oneline --graph --decorate`                                                                          |
| `lgm`        | Show detailed log with graph, decorations, and commit body.   | `git log --pretty=format:"%C(auto)%h %C(bold blue)%an %C(auto)%d %s%n%b%C(reset)" --graph --decorate --abbrev-commit` |
| `pushf`      | Force push safely with lease.                                 | `git push --force-with-lease`                                                                                         |
| `ri`         | Interactive rebase.                                           | `git rebase -i`                                                                                                       |
| `save`       | Save changes to stash.                                        | `git stash save`                                                                                                      |
| `st`         | Show the working tree status.                                 | `git status`                                                                                                          |
| `undo`       | Undo the last commit but keep the changes.                    | `git reset HEAD~1`                                                                                                    |


---

#### **Color Settings**
| Feature | Description                             | Value  |
| ------- | --------------------------------------- | ------ |
| `ui`    | Enable colored output for Git commands. | `true` |

---

#### **Commit Settings**
| Feature    | Description                               | Value           |
| ---------- | ----------------------------------------- | --------------- |
| `gpgSign`  | Enable GPG signing for commits.           | `true`          |
| `template` | Specify the commit message template file. | `~/.gitmessage` |

---

#### **Core Settings**
| Feature        | Description                                              | Value                 |
| -------------- | -------------------------------------------------------- | --------------------- |
| `autocrlf`     | Normalize line endings for cross-platform compatibility. | `input`               |
| `editor`       | Set the default editor for Git commands.                 | `code --wait`         |
| `excludesfile` | Specify the global `.gitignore` file.                    | `~/.gitignore_global` |
| `pager`        | Set the pager for command output.                        | `less -RFX`           |

---

#### **Credential Settings**
| Feature  | Description                  | Value   |
| -------- | ---------------------------- | ------- |
| `helper` | Cache credentials for reuse. | `cache` |

---

#### **Diff Settings**
| Feature | Description                                      | Value                               |
| ------- | ------------------------------------------------ | ----------------------------------- |
| `tool`  | Set the default diff tool.                       | `code`                              |
| `cmd`   | Specify the command for `code` as the diff tool. | `code --wait --diff $LOCAL $REMOTE` |

---

#### **GitHub Settings**
| Feature | Description      | Value     |
| ------- | ---------------- | --------- |
| `user`  | GitHub username. | `jekwwer` |

---

#### **Initialization Settings**
| Feature         | Description                                       | Value  |
| --------------- | ------------------------------------------------- | ------ |
| `defaultBranch` | Set the default branch name for new repositories. | `main` |

---

#### **Log Settings**
| Feature        | Description                               | Value   |
| -------------- | ----------------------------------------- | ------- |
| `abbrevCommit` | Show abbreviated commit hashes in logs.   | `true`  |
| `decorate`     | Show references in logs.                  | `short` |
| `graph`        | Display logs with a graph representation. | `true`  |

---

#### **Format Settings**
| Feature  | Description                          | Value                                                                 |
| -------- | ------------------------------------ | --------------------------------------------------------------------- |
| `pretty` | Customize the format of log entries. | `format:%C(auto)%h %C(bold blue)%an %C(auto)%d %s %C(dim white)(%ar)` |

---

#### **Merge Settings**
| Feature         | Description                                       | Value                 |
| --------------- | ------------------------------------------------- | --------------------- |
| `conflictstyle` | Show conflicts in diff3 format.                   | `diff3`               |
| `tool`          | Set the default merge tool.                       | `code`                |
| `cmd`           | Specify the command for `code` as the merge tool. | `code --wait $MERGED` |

---

#### **Pull Settings**
| Feature  | Description                             | Value  |
| -------- | --------------------------------------- | ------ |
| `rebase` | Rebase instead of merging when pulling. | `true` |

---

#### **Push Settings**
| Feature   | Description                    | Value    |
| --------- | ------------------------------ | -------- |
| `default` | Set the default push behavior. | `simple` |

---

#### **Rebase Settings**
| Feature     | Description                                  | Value  |
| ----------- | -------------------------------------------- | ------ |
| `autoStash` | Automatically stash changes before rebasing. | `true` |

---

#### **Rerere Settings**
| Feature   | Description                                             | Value  |
| --------- | ------------------------------------------------------- | ------ |
| `enabled` | Enable "reuse recorded resolution" for merge conflicts. | `true` |

---

#### **Tag Settings**
| Feature | Description           | Value             |
| ------- | --------------------- | ----------------- |
| `sort`  | Sort tags by version. | `version:refname` |

---

#### **User Settings**
| Feature | Description                    | Value                          |
| ------- | ------------------------------ | ------------------------------ |
| `email` | Set the email for Git commits. | `evgenii.shiliaev@jekwwer.com` |
| `name`  | Set the name for Git commits.  | `Evgenii Shiliaev`             |

## .gitignore_global

The `.gitignore_global` file is used to specify files and directories that should be ignored by Git globally, across all repositories. This prevents tracking of unnecessary or sensitive files, improving repository cleanliness and security.

### Key Features:
- **Prevents tracking of temporary, build, and user-specific files.**
- **Ignores files related to popular tools like Visual Studio, Node.js, and Python.**
- **Cleans up project repositories by ignoring auto-generated files.**
- **Enhances security by excluding sensitive files like credentials or publish settings.**

### Usage:
To enable this `.gitignore_global` file for all Git repositories:
1. Copy the `.gitignore_global` file to your home directory:
   ```bash
   cp .gitignore_global ~/.gitignore_global
   ```
2. Configure Git to use this file globally:
   ```bash
   git config --global core.excludesfile ~/.gitignore_global
   ```

### Complete Ignored Files and Directories List:

This file is based on [github/gitignore/VisualStudio.gitignore](https://github.com/github/gitignore/blob/main/VisualStudio.gitignore)
accumulating best practices and includes patterns for:
- **User-specific files**: Temporary editor files, settings, and logs.
- **Build directories**: `bin/`, `obj/`, and platform-specific folders like `x64/` and `x86/`.
- **Tool-specific files**: Files generated by Visual Studio, Xamarin, Node.js, Python, and others.
- **Temporary files**: Backup files, `.tmp` files, and cache directories.
- **Publish and deployment files**: Files created during Azure or web deployment.

For a detailed list of ignored files and directories, refer to the `.gitignore_global` file in this repository.

## .gitmessage

The `.gitmessage` file defines a standardized commit message template to ensure consistency, clarity, and quality in commit messages. This template is designed to align with best practices and provide essential details about changes.

### Template Structure:
```plaintext
<type>(<scope>): <description>

<detailed description>

[FILES ADDED/MODIFIED]


[PURPOSE]


[IMPACT]


[FIXES/RESOLVES/REFERENCE]
```

### Template Fields:
- **`<type>`**: Specifies the type of change being committed. Common types include:
  - `feat`: A new feature.
  - `fix`: A bug fix.
  - `docs`: Documentation changes.
  - `style`: Code style updates (formatting, no code changes).
  - `refactor`: Code restructuring without changing functionality.
  - `test`: Adding or updating tests.
  - `chore`: Maintenance tasks (e.g., build scripts, dependency updates).
- **`<scope>`**: Specifies the area of the codebase affected (optional).
- **`<description>`**: A concise summary of the change.
- **`<detailed description>`**: Provides a more detailed explanation of the change (optional).
- **`[FILES ADDED/MODIFIED]`**: Lists the files affected by the commit (optional).
- **`[PURPOSE]`**: Explains the purpose or motivation for the change (optional).
- **`[IMPACT]`**: Describes the impact of the change on the project or users (optional).
- **`[FIXES/RESOLVES/REFERENCE]`**: References related issues, pull requests, or tasks (optional).

### Example Commit Message:
```plaintext
feat(authentication): add OAuth2 login support

Implemented OAuth2 login functionality for the application.
This includes integration with Google and GitHub as identity providers.

[FILES ADDED/MODIFIED]
- src/auth/oauth2.py
- src/auth/tests/test_oauth2.py

[PURPOSE]
Enable users to log in using external identity providers.

[IMPACT]
Improves user authentication experience and security.

[FIXES/RESOLVES/REFERENCE]
- Resolves #123
- References PR #456
```

### Usage:
1. Save the `.gitmessage` file in your home directory:
   ```bash
   cp .gitmessage ~/.gitmessage
   ```
2. Configure Git to use this commit message template:
   ```bash
   git config --global commit.template ~/.gitmessage
   ```

### Benefits:
- Encourages clear and meaningful commit messages.
- Simplifies collaboration by providing context for changes.
- Helps in tracking and understanding changes during reviews or debugging.
- Aligns with conventional commit message standards.
