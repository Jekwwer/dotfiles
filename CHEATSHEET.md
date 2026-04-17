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

| Alias | Command                                |
| ----- | -------------------------------------- |
| `gca` | `git amend`                            |
| `gci` | `git commit`                           |
| `gco` | `git checkout`                         |
| `gf`  | `git fetch`                            |
| `gfi` | `git fixup`                            |
| `gl`  | `git log --oneline --graph --decorate` |
| `gpl` | `git pull`                             |
| `gpf` | `git push --force-with-lease`          |
| `gps` | `git push`                             |
| `gst` | `git status`                           |

### Misc

| Alias    | Command                                                                                  |
| -------- | ---------------------------------------------------------------------------------------- |
| `clr`    | `clear`                                                                                  |
| `update` | `brew update && brew upgrade` (macOS) / `sudo apt update && sudo apt upgrade -y` (Linux) |

## Shell Functions (`.shell_common`)

| Function       | Description                                    |
| -------------- | ---------------------------------------------- |
| `hgrep <text>` | Search command history: `history \| grep "$1"` |
| `reload`       | Re-source `.zshrc` or `.bashrc`                |

## Git Aliases (`.gitconfig`)

| Alias        | Command                                  |
| ------------ | ---------------------------------------- |
| `amend`      | `commit --amend`                         |
| `br`         | `branch`                                 |
| `ci`         | `commit`                                 |
| `co`         | `checkout`                               |
| `d`          | `diff`                                   |
| `del-branch` | `push origin --delete <branch>`          |
| `ds`         | `diff --staged`                          |
| `fixup`      | `commit --amend --no-edit`               |
| `lg`         | `log --oneline --graph --decorate`       |
| `lga`        | `log --all --oneline --graph --decorate` |
| `lgm`        | detailed log with body + graph           |
| `pushf`      | `push --force-with-lease`                |
| `ri`         | `rebase -i`                              |
| `save`       | `stash push`                             |
| `st`         | `status`                                 |
| `undo`       | `reset HEAD~1`                           |

## Environment Variables (`.shell_common`)

| Variable | Value                              |
| -------- | ---------------------------------- |
| `EDITOR` | `vim`                              |
| `VISUAL` | `vim`                              |
| `PAGER`  | `less`                             |
| `PATH`   | `$HOME/bin:$HOME/.local/bin:$PATH` |
| `LANG`   | `en_US.UTF-8`                      |
| `LC_ALL` | `en_US.UTF-8`                      |
