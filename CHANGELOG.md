# Changelog

## 2.2.0 - 2026-04-24
### 🚀 New Features

* **gitmessage:** align with new commit-message skill style ([236793d](https://github.com/Jekwwer/dotfiles/commit/236793da5a02ed2d4fdca95e1716745bd89f4035))

### 🔧 Chores

* **config:** set JSON line length limit to 88 ([7f9ef8c](https://github.com/Jekwwer/dotfiles/commit/7f9ef8c32968e87c324f75917d9e5de51984f0ea))
* **releaserc:** remove redundant file-label comment ([568a54e](https://github.com/Jekwwer/dotfiles/commit/568a54e6899eaa761fdec01e9492559fddf1dcab))

## 2.1.0 - 2026-04-20
### 🚀 New Features

* **scripts:** add prune-cspell-words CLI tool ([68e5bfc](https://github.com/Jekwwer/dotfiles/commit/68e5bfc9af7cd1441be0798a5b1a450d809782a6))

### 🔧 Chores

* **editorconfig:** remove redundant label comments ([00411a3](https://github.com/Jekwwer/dotfiles/commit/00411a353c129660ad37b9fbe95ba9d80d80559d))

## 2.0.0 - 2026-04-17
### ⚠️ BREAKING CHANGES

* commit-gen is no longer available. Remove any scripts, aliases, or gitconfig hooks that reference it.

### 🚀 New Features

* **gitconfig:** add modern git options, fix deprecated alias, drop redundant settings ([ea6ae00](https://github.com/Jekwwer/dotfiles/commit/ea6ae006b8de352b82d07b369eb47062edd7c719))
* remove commit-gen script and infrastructure ([3ea96df](https://github.com/Jekwwer/dotfiles/commit/3ea96df746d575c81a43ca58fc9b42988d455e86))
* **shell:** split shell config into .shell_common, .bashrc, and .zshrc ([d8789cd](https://github.com/Jekwwer/dotfiles/commit/d8789cd44d45b35f19e16f9fcdaa2fb074102bea))

### 🐞 Bug Fixes

* **bashrc:** remove bugs/dead code, add cdspell, fix colors, update docs ([6172697](https://github.com/Jekwwer/dotfiles/commit/61726977a194719bda2edc9557c9863a916d6748))
* **ci:** add fetch-depth, fix permissions, drop NPM_TOKEN, bump Node ([ece5518](https://github.com/Jekwwer/dotfiles/commit/ece551884d19ffcb80789373e94bd60d27ad65d7))
* **install:** make portable, harden error handling, drop noise ([acab28b](https://github.com/Jekwwer/dotfiles/commit/acab28be692b677fc56654325f089b77c4a515d1))
* **prettierrc:** set JSON printWidth to 10000 for no-limit intent ([6016c51](https://github.com/Jekwwer/dotfiles/commit/6016c5190923f48cf096ef717cacf548814f1129))
* **release:** add breaking change rule to trigger major release ([1cc7898](https://github.com/Jekwwer/dotfiles/commit/1cc78981c13bc89bc04e2e945f0961f23220dea6))
* **wgetrc:** fix timestamping conflict, add connect_timeout, remove noise ([c90c4bd](https://github.com/Jekwwer/dotfiles/commit/c90c4bd478a0dfcc0ef56ef56f8935298c6f6cc0))

### 📖 Documentation

* **gitmessage:** fix BREAKING CHANGE, drop TECHNIQUES, rename CHANGES, fix issue refs ([9887064](https://github.com/Jekwwer/dotfiles/commit/98870645074f5ae2f72b2d6ba2494af0140fcffd))
* slim README, add CHEATSHEET.md, update package.json metadata ([ffabb3e](https://github.com/Jekwwer/dotfiles/commit/ffabb3e8c092778c75cec2f478ca47f439a6108f))

### 🔧 Chores

* **license:** switch from GPL-3.0 to MIT ([7c2b7e4](https://github.com/Jekwwer/dotfiles/commit/7c2b7e4066449090af5c6ffa5a13bc328841d5ac))

## 1.6.1 - 2025-06-15
### 🐞 Bug Fixes

* **commit-gen:** update pre-commit command to run only on staged files ([a4520d1](https://github.com/Jekwwer/dotfiles/commit/a4520d14e3a06aa5f32681f8e1d986fdae6b98fc))
* **docs:** correct username in clone command in installation section ([d55dd2d](https://github.com/Jekwwer/dotfiles/commit/d55dd2d1c2d50ff12f4d0c67ecb5d8c00483c280))

## 1.6.0 - 2025-06-13
### 🚀 New Features

* **ci:** add caching to release workflow and optimize commands ([3f8a6ae](https://github.com/Jekwwer/dotfiles/commit/3f8a6ae73e8a1098bd5162a8f28733e34cb51c80))
* **commitmsg-generator:** add poetry support for pre-commit hooks ([c01f29e](https://github.com/Jekwwer/dotfiles/commit/c01f29e0fcc313638349e88f9bd1339d11a7f7ab))
* **config:** expand prettier configuration ([5a5d704](https://github.com/Jekwwer/dotfiles/commit/5a5d704008a090b33facbbf13fa14475cf5f24dc))

### 🐞 Bug Fixes

* **shell:** enhance setup message for clarity and branding ([fa999a0](https://github.com/Jekwwer/dotfiles/commit/fa999a00fa88e1013d5ba62035bcb506b713a53c))
* **wgetrc:** correct spelling typo in configuration comment ([e39bf4b](https://github.com/Jekwwer/dotfiles/commit/e39bf4bdcdb3eee7ccff3923eb5d2af7e6db7e89))

### 📦 Dependency Updates

* **ci:** bump actions/setup-node to v4.4.0 ([9350e8c](https://github.com/Jekwwer/dotfiles/commit/9350e8c5e13efe7ef49d95840ddc1c92bd423557))
* **npm:** bump dependencies to latest versions ([7fd5d8e](https://github.com/Jekwwer/dotfiles/commit/7fd5d8ef95e99414fd2bec2750db7cea9dba0d7a))

### 📖 Documentation

* **README:** update installation instructions for Codespaces users ([8b335bb](https://github.com/Jekwwer/dotfiles/commit/8b335bb958b83d698282b0b3e87dd78635c0620c))

### 🔧 Chores

* **editorconfig:** unify comment styles ([61e51f1](https://github.com/Jekwwer/dotfiles/commit/61e51f1ac783786d73d756f238932b8a163660fe))
* **license:** change license to GPL v3 ([90acc0e](https://github.com/Jekwwer/dotfiles/commit/90acc0ebe1f58c28295a3cdfff6378ea88f29e0d))
* **metadata:** update package.json metadata ([782522d](https://github.com/Jekwwer/dotfiles/commit/782522d0492972e3450d4a8668dda18a84c489e8))
* **release:** update package files on release ([10ce635](https://github.com/Jekwwer/dotfiles/commit/10ce635e48bc7dacc0b2d91b61f02fd92e50bf20))

## 1.5.0 - 2025-02-18
### 🚀 New Features

* **commit-gen:** update breaking changes instructions ([ee572b1](https://github.com/Jekwwer/dotfiles/commit/ee572b1723f3a72a7f503c5d41d035082e50f467))

### 🐞 Bug Fixes

* **config:** remove invalid attribute from .prettierrc ([deea858](https://github.com/Jekwwer/dotfiles/commit/deea858e008880e8f6feadec6a2221a7308a90c7))
* **install:** resolve global gitignore configuration issue ([3ce8da2](https://github.com/Jekwwer/dotfiles/commit/3ce8da2093e93f56ea6b7e5d95f22b2041b668b6))
* **package:** update package manager syntax ([072b4cd](https://github.com/Jekwwer/dotfiles/commit/072b4cdac1fe42880047fbf37b29a64359b05d86))

### 📖 Documentation

* **editorconfig:** add note about unofficial attribute ([d9c5cd1](https://github.com/Jekwwer/dotfiles/commit/d9c5cd185bb78102161101174753e84d8f9af0f7))
* **template:** update commit message template instructions ([2cbb310](https://github.com/Jekwwer/dotfiles/commit/2cbb310d9a80e2c15f24bfdf558ec870db87ec0d))

### 🔧 Chores

* **gitignore:** add direct references to gitignore sources ([d7ec82e](https://github.com/Jekwwer/dotfiles/commit/d7ec82ea348d0f07833fd496977e8ccc4762e830))

## 1.4.1 - 2025-02-14
### 🔒 Security Updates

* **deps:** update [@octokit](https://github.com/octokit) dependencies to mitigate security vulnerabilities ([9cf74cb](https://github.com/Jekwwer/dotfiles/commit/9cf74cb538d475b6dcf641e50e47ab2e476845f2)), closes [#1](https://github.com/Jekwwer/dotfiles/issues/1) [#2](https://github.com/Jekwwer/dotfiles/issues/2)

### 📖 Documentation

* **readme:** update README for common-docs v1.1.0 release ([a6c506e](https://github.com/Jekwwer/dotfiles/commit/a6c506e6bc1fd31f80089280d7fc7b32a6983327))

## 1.4.0 - 2025-02-03
### 🚀 New Features

* **prettierrc:** clean up editorconfig and add synced Prettier configuration ([6ebe70b](https://github.com/Jekwwer/dotfiles/commit/6ebe70bd68466d6891466e5b8d5dfea7ec40960a))

### 📖 Documentation

* **license:** add LICENSE file and update license references ([ba6a8cc](https://github.com/Jekwwer/dotfiles/commit/ba6a8cc2d36a50c6ad93b9c9a969bcbc93738800))

### 🔧 Chores

* **releaserc:** remove unnecessary rule and asset settings ([a1c5b57](https://github.com/Jekwwer/dotfiles/commit/a1c5b57693a8a7c94ae44623a3adc9feeb2fb3f1))

## 1.3.1 - 2025-01-23
### 🐞 Bug Fixes

* **gitconfig:** redirect input/output to display prompts from commit-gen ([1767883](https://github.com/Jekwwer/dotfiles/commit/176788337180f261972d27f28eb3d0e47e0ea9dc))

## 1.3.0 - 2025-01-22

### 🚀 New Features

* **commit-gen:** add pre-commit check to prevent wasted tokens ([75960a1](https://github.com/Jekwwer/dotfiles/commit/75960a11d585331637cc526e3073b86fdfe4b0a7))

### 📖 Documentation

* **readme:** update with Node.gitignore reference and details ([ba905e6](https://github.com/Jekwwer/dotfiles/commit/ba905e62142955e55706c47152e41fff1a91072a))

### 🔧 Chores

* **gitignore:** add Node gitignore patterns to global gitignore ([9fc5118](https://github.com/Jekwwer/dotfiles/commit/9fc51182468a1f7d3b9f21fe6275d5e4e0d2128f))

## 1.2.0 - 2025-01-21
### 🚀 New Features

* **release:** add custom sort and migrate config to .js ([1c2d6e0](https://github.com/Jekwwer/dotfiles/commit/1c2d6e0ef998e18668102d97f1992425550e0ca4))

### 🐞 Bug Fixes

* **docs:** correct spelling errors in configuration files ([c27b46c](https://github.com/Jekwwer/dotfiles/commit/c27b46c34d094dec1a6145cc153cfb7bcb3718ea))

### 🔧 Chores

* **changelog:** sort entries by new config ([9810bf4](https://github.com/Jekwwer/dotfiles/commit/9810bf4122e124470bd745454631a11e20163127))
* **ci:** add range to node version in release workflow ([b4283ee](https://github.com/Jekwwer/dotfiles/commit/b4283ee0de2648f6f29dd5d7c531c7145a961414))
* enhance package.json with logically sorted metadata ([4a8aa43](https://github.com/Jekwwer/dotfiles/commit/4a8aa439ed66716818aaf39789ed143903240498))

## 1.1.0 - 2025-01-20
### 🚀 New Features

* **ci:** add dependency verification to release workflow ([08351ff](https://github.com/Jekwwer/dotfiles/commit/08351ff503176011d81d4b43ba53447663df5d79))

### 📖 Documentation

* **changelog:** add notice about versioning style migration ([f7ac57b](https://github.com/Jekwwer/dotfiles/commit/f7ac57bf596a026e15d94b235efab34c7eda4e16))
* **readme:** clarify licensing information ([3912022](https://github.com/Jekwwer/dotfiles/commit/3912022c332cb2467469cbfa7e08a68de4aeb0c2))

## 1.0.0 - 2025-01-20

### ⚠️ BREAKING CHANGES

#### Tagging Transition Notice

As of `v1.0.0`, I have transitioned from using date-based tags (e.g., `2025-01-01`) to semantic versioning (e.g., `v1.0.0`).

This change allows me to:
- Align with the [Semantic Versioning](https://semver.org/) standard.
- Automate releases with tools like Semantic Release.
- Improve consistency and compatibility across projects.

Version `v1.0.0` includes all commits from the repository start point.

### 🚀 New Features

* add .bashrc for shell customization ([321343d](https://github.com/Jekwwer/dotfiles/commit/321343de2ea5efd23986bad3e4de09662dd207c9))
* add .editorconfig for consistent coding styles ([6612bed](https://github.com/Jekwwer/dotfiles/commit/6612bedabbbfaee9283e941d9ca49ccaddc502b9))
* add .gitattributes for repository settings ([1982678](https://github.com/Jekwwer/dotfiles/commit/1982678c4f58fc68da979e260253370c41034776))
* add .gitconfig for user identity ([48e2a46](https://github.com/Jekwwer/dotfiles/commit/48e2a4648c0c4a9110daeace4e59de1202771b50))
* add .wgetrc configuration file ([d0913c8](https://github.com/Jekwwer/dotfiles/commit/d0913c8f9663f9ed4b44463c79c4b633570ba9f6))
* add commit message template ([f37ae08](https://github.com/Jekwwer/dotfiles/commit/f37ae0810447cae89c029dc0ca56baeb657ac8cd))
* add global gitignore file ([1acfd3b](https://github.com/Jekwwer/dotfiles/commit/1acfd3b27b27a02457d868cf3e30ea843bec3d51))
* **aliases:** expand Git and Bash aliases for improved workflows ([2234834](https://github.com/Jekwwer/dotfiles/commit/22348340858f60d5f769a9e80f511e8fba720d96))
* **bash-git-setup:** add new aliases and update README with script details ([81f2ec8](https://github.com/Jekwwer/dotfiles/commit/81f2ec8e713b1b7dfcb5d6cc377d6019ab3b8890))
* **bashrc:** enhance core shell configuration ([6f637a1](https://github.com/Jekwwer/dotfiles/commit/6f637a1ad5978cd7ca548e5a2331a10b8eb32524))
* **ci:** add semantic-release configuration ([9431e53](https://github.com/Jekwwer/dotfiles/commit/9431e53e6ca8e7e19a394a25d9efedcb6c062e9a))
* **commit-gen:** add automated commit message generator ([4204867](https://github.com/Jekwwer/dotfiles/commit/42048678e5056ac88cd8912fdcf18fee6ca3b9a4))
* **config:** add .curlrc config for curl command-line tool behavior ([6617bcd](https://github.com/Jekwwer/dotfiles/commit/6617bcd99f0b91c0dde3b3b408d69456102ff146))
* enhance git configuration with aliases and settings ([a31450d](https://github.com/Jekwwer/dotfiles/commit/a31450dfd92e65c70fe663ae96cff4cf3b08cecb))
* **install:** add .editorconfig handling to dotfiles install script ([2ca3463](https://github.com/Jekwwer/dotfiles/commit/2ca3463a77316afdf677cf1063a036e4c37414e0))
* **install:** add .wgetrc to be managed by install.sh ([352412f](https://github.com/Jekwwer/dotfiles/commit/352412f10a0158c90efee6a95fd7b7faa1f7207c))
* **script:** enhance instructions in commit-gen.py ([c6625a1](https://github.com/Jekwwer/dotfiles/commit/c6625a177fb687ba2a88bcd78e1e042c0e9e81c0))

### 🐞 Bug Fixes

* **gitconfig:** fix smart-commit alias to function correctly ([48ed113](https://github.com/Jekwwer/dotfiles/commit/48ed11361633b9e29a7a5884608f41738f522a7d))

### 📖 Documentation

* **git:** update `.gitmessage` template and enhance README documentation ([561207a](https://github.com/Jekwwer/dotfiles/commit/561207a614557740ecbcfef3e13fb2c888ff5e29))
* **readme:** add .editorconfig details to README.md ([5bfa6a7](https://github.com/Jekwwer/dotfiles/commit/5bfa6a73b42fdff864c5c925b55755d3fa07965e))
* **README:** add detailed information for .wgetrc configuration ([b5ed10a](https://github.com/Jekwwer/dotfiles/commit/b5ed10ad244c2d00689e1b1ad961d182c3e10c73))
* **readme:** add license clarification ([f55a6f6](https://github.com/Jekwwer/dotfiles/commit/f55a6f6893480431dfce536dd742c953cea0ada2))
* **readme:** document .bashrc features and usage ([82e9586](https://github.com/Jekwwer/dotfiles/commit/82e95867569a13ada7304a59cb45a753b0e56fff))
* **readme:** document .gitattributes usage and key configurations ([61a246b](https://github.com/Jekwwer/dotfiles/commit/61a246b199d42195ccc5b9fe255de7d568b369ad))
* **readme:** document .gitconfig features and usage ([482e917](https://github.com/Jekwwer/dotfiles/commit/482e917b1bf7fe87779be8ad1254ba7034c603b1))
* **readme:** document .gitignore_global features and usage ([a2e9696](https://github.com/Jekwwer/dotfiles/commit/a2e969611357d657c2ffd24cbb3327a02970c28e))
* **readme:** document .gitmessage usage and structure ([0c401a3](https://github.com/Jekwwer/dotfiles/commit/0c401a3cba4d92002bba55e7ea3ca7d9fbe0b83b))
* **readme:** refine README.md for consistency ([9e701c5](https://github.com/Jekwwer/dotfiles/commit/9e701c578e71628e392299f6a0624e942bf6ea2e))
* **readme:** update .bashrc section with core configuration details ([85ab4bb](https://github.com/Jekwwer/dotfiles/commit/85ab4bbebea006b282b952a2c55f129b084fb7e3))
* **readme:** update README with detailed .curlrc information ([a2a2c16](https://github.com/Jekwwer/dotfiles/commit/a2a2c169ceff1610a02e74b620a34a996c40962c))

### 🔧 Chores

* **bashrc:** relax safety settings for usability ([8e5fb25](https://github.com/Jekwwer/dotfiles/commit/8e5fb25177b7a76da66f322691e7371ab87ea8ab))

