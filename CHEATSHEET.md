# Cheatsheet

Quick reference for aliases, functions, and settings defined in this dotfiles repo.

## Shell Aliases (`.shell_common`)

### Navigation

| Alias  | Command       |
| ------ | ------------- |
| `..`   | `cd ..`       |
| `...`  | `cd ../..`    |
| `....` | `cd ../../..` |

### File Listing

| Alias | Command  |
| ----- | -------- |
| `l`   | `ls -CF` |
| `la`  | `ls -A`  |
| `ll`  | `ls -la` |

### Safe File Operations

| Alias | Command |
| ----- | ------- |
| `cp`  | `cp -i` |
| `mv`  | `mv -i` |
| `rm`  | `rm -i` |

### Git

| Alias  | Command                             |
| ------ | ----------------------------------- |
| `gb`   | `git branch`                        |
| `gca`  | `git amend`                         |
| `gci`  | `git commit`                        |
| `gco`  | `git checkout`                      |
| `gd`   | `git diff`                          |
| `gdel` | `git push origin --delete <branch>` |
| `gds`  | `git diff --staged`                 |
| `gf`   | `git fetch`                         |
| `gfi`  | `git fixup`                         |
| `gl`   | `git log --oneline --graph`         |
| `gla`  | `git log --all --oneline --graph`   |
| `glm`  | detailed log with body + graph      |
| `gpl`  | `git pull`                          |
| `gpf`  | `git push --force-with-lease`       |
| `gps`  | `git push`                          |
| `gri`  | `git rebase -i`                     |
| `grs`  | `git restore`                       |
| `gst`  | `git status`                        |
| `gsv`  | `git stash push`                    |
| `gsw`  | `git switch`                        |
| `gun`  | `git reset HEAD~1`                  |

### Misc

| Alias    | Command                                                                                                              |
| -------- | -------------------------------------------------------------------------------------------------------------------- |
| `update` | `brew update && brew upgrade && brew cleanup` (macOS) / `sudo apt update && sudo apt upgrade -y && sudo apt autoremove` (Linux) |

## Shell Functions (`.shell_common`)

| Function       | Description                                    |
| -------------- | ---------------------------------------------- |
| `hgrep <text>` | Search command history: `history \| grep "$1"` |
| `reload`       | Re-source `.zshrc` or `.bashrc`                |

## Git Aliases (`.gitconfig`)

| Alias        | Command                         |
| ------------ | ------------------------------- |
| `amend`      | `commit --amend`                |
| `br`         | `branch`                        |
| `ci`         | `commit`                        |
| `co`         | `checkout`                      |
| `d`          | `diff`                          |
| `del-branch` | `push origin --delete <branch>` |
| `ds`         | `diff --staged`                 |
| `f`          | `fetch`                         |
| `fixup`      | `commit --amend --no-edit`      |
| `lg`         | `log --oneline --graph`         |
| `lga`        | `log --all --oneline --graph`   |
| `lgm`        | detailed log with body + graph  |
| `pl`         | `pull`                          |
| `ps`         | `push`                          |
| `pushf`      | `push --force-with-lease`       |
| `ri`         | `rebase -i`                     |
| `rs`         | `restore`                       |
| `save`       | `stash push`                    |
| `st`         | `status`                        |
| `sw`         | `switch`                        |
| `undo`       | `reset HEAD~1`                  |

## Environment Variables (`.shell_common`)

| Variable | Value                              |
| -------- | ---------------------------------- |
| `EDITOR` | `vim`                              |
| `VISUAL` | `vim`                              |
| `PAGER`  | `less`                             |
| `LESS`   | `FRX`                              |
| `PATH`   | `$HOME/bin:$HOME/.local/bin:$PATH` |
| `LANG`   | `en_US.UTF-8`                      |
| `LC_ALL` | `en_US.UTF-8`                      |
