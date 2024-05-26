# dotfiles

My dotfiles, managed with https://chezmoi.io. Primary for Macos

Original repo by author of chezmoi: https://github.com/twpayne/dotfiles

## Install


```bash
email="you-email@example.com"
firstname="my-name"
surname="surname"
githubusername="githubusername"

bash -c "CHZ_EMAIL="$email"; CHZ_FIRSTNAME="$firstname"; CHZ_FAMILYNAME="$surname"; CHZ_GITHUBUSERNAME="$githubusername"; $(curl -fsSL https://raw.githubusercontent.com/luboszima/dotfiles/main/install.sh)"
```
This one line installer failing on fresh installed computer. The best way now is install chezmoi + run command chezmoi init

```bash 
bin_dir="$HOME/.local/bin"
sh -c "$(curl -fsSL https://git.io/chezmoi)" -- -b "$bin_dir"
$bin_dir init --apply luboszima
```
