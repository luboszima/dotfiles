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
  - but you still need to visit Settings -> General -> Software Update and click to install
- [run_onchange_before_00-generate-ssh-keys.sh.tmpl](template%2F.chezmoiscripts%2Fdarwin%2Frun_onchange_before_00-generate-ssh-keys.sh.tmpl) - it generates default ssh keys
- [run_onchange_before_01-install-packages.sh.tmpl](template%2F.chezmoiscripts%2Fdarwin%2Frun_onchange_before_01-install-packages.sh.tmpl) - install brew packages and tools
- [run_onchange_after_01-configure-dock.sh](template%2F.chezmoiscripts%2Fdarwin%2Frun_onchange_after_01-configure-dock.sh) - configure macos dock
- [run_onchange_after_02-configure-oh-my-zsh.sh](template%2F.chezmoiscripts%2Fdarwin%2Frun_onchange_after_02-configure-oh-my-zsh.sh) - install oh-my-zsh + powerlevel10k theme
- [run_onchange_after_03-gh-auth.sh](template%2F.chezmoiscripts%2Fdarwin%2Frun_onchange_after_03-gh-auth.sh) - invoke github login in you browser
- [run_onchange_after_04-development_dir.sh](template%2F.chezmoiscripts%2Fdarwin%2Frun_onchange_after_04-development_dir.sh) - create ~/Development directory
- [run_onchange_after_05-company-portal.sh](template%2F.chezmoiscripts%2Fdarwin%2Frun_onchange_after_05-company-portal.sh) - install Microsoft Company portal
- [run_onchange_after_06-configure-vscode.sh.tmpl](template%2F.chezmoiscripts%2Fdarwin%2Frun_onchange_after_06-configure-vscode.sh.tmpl) - install VsCode extensions
  - extensions are as a list in [.chezmoi.toml.tmpl](template%2F.chezmoi.toml.tmpl)
