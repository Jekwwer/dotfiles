# dotfiles

Personal development environment configuration for Linux/Codespaces and macOS.

## Features ✨

- **Shell Configuration**:
  - **`.shell_common`**: Shared aliases, functions, and environment variables sourced by both shells.
  - **`.bashrc`** (Linux/Codespaces): Bash-specific history, completions, and prompt.
  - **`.zshrc`** (macOS): Zsh-specific history, options, and prompt.
- **Editor Configuration** (`.editorconfig`): Enforces consistent coding styles for various file types.
- **Git Configuration** (`.gitattributes`, `.gitconfig`, `.gitignore_global`, `.gitmessage`): Standardized settings,
  improved workflows, and commit message templates.
- **Curl Configuration** (`.curlrc`): Enhanced `curl` settings for security, performance, and usability.
- **Wget Configuration** (`.wgetrc`): Enhanced `wget` settings for reliability, security, and convenience.
- **Scripts**:
  - **`install.sh`**: A setup script for linking dotfiles and preparing the environment.
  - **`prune-cspell-words`**: Remove stale words from a `cspell.json` words list.

## License 🛡️

This project is released under the [MIT License][LICENSE].

## Installation 📦

> **Codespaces users:** If you've already set this repo as your "dotfiles" in your GitHub Codespaces settings, no
> further setup is required—your Codespaces environment will automatically apply these configurations.

1. Clone the repository into your Codespaces or local machine:

   ```bash
   git clone https://github.com/Jekwwer/dotfiles.git ~/.dotfiles
   ```

2. Run the `install.sh` script:

   ```bash
   ~/.dotfiles/install.sh
   ```

3. Restart your terminal or apply the changes:

   macOS:

   ```bash
   source ~/.zshrc
   ```

   Linux/Codespaces:

   ```bash
   source ~/.bashrc
   ```

## .bashrc

Bash shell config for Linux/Codespaces. Sources `.shell_common` for shared settings.

- Interactive-only guard, lesspipe integration, and bash-completion setup
- History: 5 000 in memory / 10 000 on disk, dedup, ignores trivial commands, append-only
- Shell options: `globstar`, `dirspell`, `cdspell`
- Prompt: `user@host dir (branch)$` in color

## .shell_common

Shared config sourced by both `.bashrc` and `.zshrc`. See [CHEATSHEET.md][CHEATSHEET.md] for the full alias and function
reference.

- Environment: `EDITOR`/`VISUAL=vim`, `PAGER=less`, UTF-8 locale, `~/bin` and `~/.local/bin` on `PATH`
- Navigation aliases: `..`, `...`, `....`
- File aliases: `ll`, `la`, `l`; safe `rm`/`mv`/`cp` (with `-i`)
- Git aliases: `gst`, `gci`, `gca`, `gfi`, `gco`, `gf`, `gpl`, `gps`, `gpf`, `gl`
- Functions: `hgrep <text>` (history search), `reload` (re-source config)
- OS-specific: `CLICOLOR`/`LSCOLORS` + `brew` update alias on macOS; `ls --color=auto` + `apt` update alias on Linux
- `git_branch` helper used by both prompts

## .zshrc

Zsh shell config for macOS. Sources `.shell_common` for shared settings.

- Completion: `compinit`
- History: 5 000 in memory / 10 000 on disk, dedup, ignores trivial commands, incremental write
- Shell options: `GLOB_STAR_SHORT`, `CORRECT`, `CORRECT_ALL`
- Prompt: `user@host dir (branch)$` in color using `PROMPT_SUBST`

## .curlrc

- Progress bar, follows redirects, retries up to 3× on any error
- Timeouts: 15 s connect, 120 s max (override with `--max-time 0` for large downloads)
- Enforces 2048-bit keys and SHA-256+ ciphers (`DEFAULT:@SECLEVEL=2`)
- `--fail-with-body`: exits non-zero on 4xx/5xx but still prints the response

## .wgetrc

- Retries up to 3×; timeouts: 15 s connect, 20 s read, 10 s DNS
- Resumes partial downloads (`continue = on`)
- Uses system CA certificates (`/etc/ssl/certs`)

## .editorconfig

Fallback coding-style rules when a project has no `.editorconfig` of its own.

- Defaults: UTF-8, LF endings, 2-space indent, trim trailing whitespace, final newline, 88-char line limit
- Markdown: 120-char limit, preserve trailing whitespace (for line breaks)
- JSON: 88-char limit
- Shell scripts: 4-space indent
- Text/log files: preserve trailing whitespace

## .gitattributes

- Normalizes line endings (`* text=auto`); enforces LF on checkout for source files
- Marks images, fonts, PDFs, and archives as binary
- Custom diff drivers for JSON and XML
- Skips diffing `.log` files
- Excludes temp files, editor dirs, and `node_modules/` from `git archive`
- Excludes minified/map files from GitHub language statistics

## .gitconfig

See [CHEATSHEET.md][CHEATSHEET.md] for the full alias reference.

- User: Evgenii Shiliaev; GPG-signed commits; `~/.gitmessage` template
- Core: `code --wait` editor, histogram diff, `less -RFX` pager, fsmonitor, untracked cache
- Workflow: rebase on pull, `autoSetupRemote`, safe force-push via `pushf`, `rerere`, `autoStash`
- Log: abbreviated hashes, short decorations, custom pretty format
- Branches sorted by most recent commit; tags sorted by version

## .gitignore_global

Global gitignore applied to all repositories. Covers:

- OS files: `.DS_Store`, `Thumbs.db`
- Editor/IDE: `.idea/`, `.vscode/`, `*.swp`
- Build artifacts: `bin/`, `obj/`, `x64/`, `x86/`
- Node.js: `node_modules/`, `*.log`, coverage, cache directories
- Temp files: `*.tmp`, `*.bak`

## .gitmessage

Conventional Commits template. Commit types that trigger a release:

| Type                              | Release |
| --------------------------------- | ------- |
| `feat`                            | minor   |
| `fix`, `security`, `deps`, `perf` | patch   |

Append `!` for breaking changes (`feat!:`); add `BREAKING CHANGE: <description>` as the **last footer** — nothing after
it, or the trailing content becomes part of the changelog note.

## install.sh

Symlinks all dotfiles into `$HOME`. Detects OS to link `.zshrc` (macOS) or `.bashrc` (Linux/Codespaces).

- Self-locating: works wherever the repo is cloned
- Always symlinks: `.shell_common`, `.curlrc`, `.editorconfig`, `.gitattributes`, `.gitconfig`, `.gitignore_global`,
  `.gitmessage`, `.wgetrc`
- OS-aware: `.zshrc` on macOS, `.bashrc` on Linux/Codespaces
- Creates `~/bin/` and symlinks `scripts/prune-cspell-words` into it

## prune-cspell-words

Remove stale words from a cspell.json words list. Symlinked into `~/bin/` by `install.sh`.

```
prune-cspell-words [-c PATH] [-n] [-v]
```

- `-c / --config PATH`: path to cspell config (default: `./cspell.json`)
- `-n / --dry-run`: preview removals without modifying the file
- `-v / --verbose`: print each word as it is checked

## Contact 📬

For questions, reach out via [evgenii.shiliaev@jekwwer.com][evgenii.shiliaev@jekwwer.com].

[LICENSE]: LICENSE
[CHEATSHEET.md]: CHEATSHEET.md
[evgenii.shiliaev@jekwwer.com]: mailto:evgenii.shiliaev@jekwwer.com
