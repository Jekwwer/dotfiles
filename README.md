# dotfiles

This repository contains configuration files (`dotfiles`) for personalizing your development environment.
These dotfiles include advanced configurations for Bash (`.bashrc`), ensuring a more productive, efficient, and user-friendly command-line experience.

## .bashrc

The `.bashrc` file included in this repository is an advanced shell configuration script designed to:
- **Streamline productivity** with aliases and functions for common tasks.
- **Enhance safety** by reducing accidental errors with safer defaults.
- **Customize the shell environment** with prompts, colors, and history management.
- **Add convenience** through auto-correction, recursive globbing, and Git branch display.

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

#### **Aliases**
| Alias    | Description                                       | Exact Command                            |
| -------- | ------------------------------------------------- | ---------------------------------------- |
| `ll`     | List files in long format including hidden files. | `ls -la`                                 |
| `la`     | List all files, including hidden ones.            | `ls -A`                                  |
| `l`      | List files in compact format.                     | `ls -CF`                                 |
| `rm`     | Safer `rm` with confirmation before deletion.     | `rm -i`                                  |
| `mv`     | Safer `mv` with confirmation before overwriting.  | `mv -i`                                  |
| `cp`     | Safer `cp` with confirmation before overwriting.  | `cp -i`                                  |
| `..`     | Navigate to the parent directory.                 | `cd ..`                                  |
| `...`    | Navigate two levels up.                           | `cd ../..`                               |
| `....`   | Navigate three levels up.                         | `cd ../../..`                            |
| `gst`    | Display Git status.                               | `git status`                             |
| `gco`    | Checkout a branch in Git.                         | `git checkout`                           |
| `gl`     | Show a concise, graphical Git log.                | `git log --oneline --graph --decorate`   |
| `update` | Update and upgrade system packages.               | `sudo apt update && sudo apt upgrade -y` |
| `clr`    | Clear the terminal screen.                        | `clear`                                  |

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
