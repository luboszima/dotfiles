#!/bin/sh

set -e # -e: exit on error

function usage() {
  echo "Usage: $0 <email> <first-name> <family-name> <github-username>"
}

# help if -h param
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    usage
    exit 0;
fi

if ! [ -z "$1" ]; then
  CHZ_EMAIL="$1"
fi

if ! [ -z "$2" ]; then
  CHZ_FIRSTNAME="$2"
fi

if ! [ -z "$3" ]; then
  CHZ_FAMILYNAME="$3"
fi

if ! [ -z "$4" ]; then
  CHZ_GITHUBUSERNAME="$4"
fi

prompt=""
if ! [ -z "$CHZ_EMAIL" ]; then
  prompt="$prompt --prompt email=$CHZ_EMAIL"
fi

if ! [ -z "$CHZ_FIRSTNAME" ]; then
  prompt="$prompt --prompt firstName=$CHZ_FIRSTNAME"
fi

if ! [ -z "$CHZ_FAMILYNAME" ]; then
  prompt="$prompt --prompt familyName=$CHZ_FAMILYNAME"
fi

if ! [ -z "$CHZ_GITHUBUSERNAME" ]; then
  prompt="$prompt --prompt githubUsername=$CHZ_GITHUBUSERNAME"
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
