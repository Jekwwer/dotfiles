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

| Alias    | Command                                                                                                                         |
| -------- | ------------------------------------------------------------------------------------------------------------------------------- |
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

## Hidden Behaviors

Config-enabled features that aren't aliases but are worth knowing about.

### Shell

| Feature                                       | Enabled by                                     | What it does                                                                  |
| --------------------------------------------- | ---------------------------------------------- | ----------------------------------------------------------------------------- |
| `!!` / `!cmd` history expansion with verify   | zsh `HIST_VERIFY`                              | `sudo !!` redoes last command as root; expansion shows on prompt before Enter |
| `**` recursive glob                           | bash `globstar` / zsh `GLOB_STAR_SHORT`        | `ls **/*.py` matches all `.py` in subtrees                                    |
| Cross-terminal history sharing                | zsh `SHARE_HISTORY`                            | Command typed in tab A retrievable via ↑ in tab B                             |
| Multi-line command saved as one history entry | bash `cmdhist`                                 | Multi-line `docker run \\…` is one ctrl+R hit                                 |
| Timestamped history                           | bash `HISTTIMEFORMAT` / zsh `EXTENDED_HISTORY` | `history` (bash) or `history -E` (zsh) shows when commands ran                |
| Typo correction in `cd` and tab paths         | bash `cdspell` / `dirspell`                    | `cd /etc/initd` → `/etc/init.d`                                               |
| Command typo suggestions                      | zsh `CORRECT`                                  | `gti status` → "did you mean git?"                                            |
| less defaults                                 | `LESS=FRX`                                     | F=quit if fits one screen, R=keep colors, X=no clear on exit                  |

### Git

| Feature                                 | Enabled by                                | What it does                                                  |
| --------------------------------------- | ----------------------------------------- | ------------------------------------------------------------- |
| Auto-stash on rebase                    | `rebase.autoStash`                        | `git rebase` stashes dirty tree, pops after — no manual stash |
| Conflict memory across rebases          | `rerere.enabled`                          | Resolve a conflict once; auto-applied on re-occurrence        |
| First push without `-u`                 | `push.autoSetupRemote`                    | `git push` on a new branch just works                         |
| Branches sorted by most recent activity | `branch.sort = -committerdate`            | `git branch` shows recently active first                      |
| Semver-correct tag order                | `tag.sort = version:refname`              | `git tag` lists v2, v10 in numeric (not lexical) order        |
| Auto-prune stale refs on fetch          | `fetch.prune = true`                      | `git fetch` drops refs to deleted remote branches             |
| 3-way conflict markers                  | `merge.conflictstyle = diff3`             | Conflict view includes common ancestor                        |
| Auto-sign commits                       | `commit.gpgSign = true`                   | Every commit GPG-signed                                       |
| Pull rebases instead of merging         | `pull.rebase = true`                      | Linear history, no merge bubbles                              |
| `git init` defaults to `main` branch    | `init.defaultBranch = main`               | No master                                                     |
| Faster `git status`                     | `core.fsmonitor` + `core.untrackedCache`  | Skips re-scanning watched / known untracked dirs              |
| Moved-code highlighting in diffs        | `diff.colorMoved = default`               | Moved code distinct from deletion+addition                    |
| Histogram diff algorithm                | `diff.algorithm = histogram`              | Better alignment for moved code                               |
| Global gitignore                        | `core.excludesfile = ~/.gitignore_global` | Patterns apply across all repos                               |
| Command typo prompt                     | `help.autocorrect = prompt`               | `git stauts` → "did you mean status? (y/N)"                   |

### Curl

| Feature                   | Enabled by              | What it does                               |
| ------------------------- | ----------------------- | ------------------------------------------ |
| Bare URL → HTTPS          | `--proto-default https` | `curl example.com` goes to https, not http |
| Auto-decompress responses | `--compressed`          | gzip/deflate transparent when piping       |
