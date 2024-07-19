# dotfile
Repo for basic computer setup

### templates

- template/.chezmoi.toml.tmpl - chezmoi config, user during init command set variables which will be used in other templates and scripts
- template/dot_bash_aliases.tmpl - bash aliases for developers and devops
- template/dot_zshrc.tmpl - zsh config file
  - PATH variable is setup there
  - loaded .bash_aliases
  - zshPlugins are set
  - oh-my-zsh is used + powerlevel10k theme is set
- template/dot_zprofile.tmpl - brew + fzf for every session is set
- template/empty_dot_hushlogin - remove login message in terminal
- template/private_dot_ssh
  - ~/.ssh directory config
  - authorized keys pulled from Github account
  - generated config file for macos
- template/private_dot_config/git
  - config files for git
  - ignore globally IDE hidden directories with IDE settings
  - git config with user name and email

### scripts

Scripts are represented as regular files in the source state with prefix run_. The file's contents (after being interpreted as a template if it has a .tmpl suffix) are executed.

Prefixes for scripts are:
- run_ - say that we can run script
- once_ - run once during apply
- onchange_ - run when something in dotfile repo is changed
- before_ - run script before apply
- after_ run script after apply

References:
- [Use scripts to perform actions](https://www.chezmoi.io/user-guide/use-scripts-to-perform-actions/)
- [Source State Attributes](https://www.chezmoi.io/reference/source-state-attributes/)
- [Target types](https://www.chezmoi.io/reference/target-types/#symbolic-links)

#### MacOS

Scripts from directory `template/.chezmoiscripts/darwin`
- [run_once_before_00-install-brew.sh.tmpl](template%2F.chezmoiscripts%2Fdarwin%2Frun_once_before_00-install-brew.sh.tmpl) - install brew
- [run_once_before_01-install-xcode.sh.tmpl](template%2F.chezmoiscripts%2Fdarwin%2Frun_once_before_01-install-xcode.sh.tmpl) - install xcode
- wip
