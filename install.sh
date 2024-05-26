#!/bin/sh

set -e # -e: exit on error

prompt=""
if ! [ -z "$CHZ_EMAIL" ]; then
  prompt="$prompt --promptString email=$CHZ_EMAIL"
fi

if ! [ -z "$CHZ_FIRSTNAME" ]; then
  prompt="$prompt --promptString firstName=$CHZ_FIRSTNAME"
fi

if ! [ -z "$CHZ_FAMILYNAME" ]; then
  prompt="$prompt --promptString familyName=$CHZ_FAMILYNAME"
fi

# install chezmoit
if [ ! "$(command -v chezmoi)" ]; then
  echo "Installing chezmoi"
  bin_dir="$HOME/.local/bin"
  chezmoi="$bin_dir/chezmoi"
  if [ "$(command -v curl)" ]; then
    sh -c "$(curl -fsSL https://git.io/chezmoi)" -- -b "$bin_dir"
  elif [ "$(command -v wget)" ]; then
    sh -c "$(wget -qO- https://git.io/chezmoi)" -- -b "$bin_dir"
  else
    echo "To install chezmoi, you must have curl or wget installed." >&2
    exit 1
  fi
else
  chezmoi=chezmoi
fi

# install brew
if ! [ -f "/opt/homebrew/bin/brew" ]; then
  echo "Installing brew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# install git
if [ ! "$(command -v git)" ]; then
  echo "Installing git"
  brew install git
fi

# POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"
# exec: replace current process with chezmoi init
exec "$chezmoi" init --purge --apply --branch main $prompt git@github.com:luboszima/dotfiles.git

# complementation
exec "$chezmoi completion zsh > ${ZDOTDIR:-~}/.zsh_completion"
