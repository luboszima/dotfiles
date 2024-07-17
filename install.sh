#!/usr/bin/env bash

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
  prompt="$prompt --promptString email=$CHZ_EMAIL"
fi

if ! [ -z "$CHZ_FIRSTNAME" ]; then
  prompt="$prompt --promptString firstName=$CHZ_FIRSTNAME"
fi

if ! [ -z "$CHZ_FAMILYNAME" ]; then
  prompt="$prompt --promptString familyName=$CHZ_FAMILYNAME"
fi

if ! [ -z "$CHZ_GITHUBUSERNAME" ]; then
  prompt="$prompt --promptString githubUsername=$CHZ_GITHUBUSERNAME"
fi


# install brew
if ! xcode-select -p > /dev/null; then
  echo "Navigate to Settings -> General -> Software Update, and click on the 'Update' button."
  echo "Installing command line tools for Xcode."
  sudo xcode-select --install
  sleep 5

  open "x-apple.systempreferences:com.apple.preferences.softwareupdate"
  echo "Press 'Enter' to continue after the update is installed."
  read
fi

sh -c "$(curl -fsLS https://git.io/chezmoi)" -- -b ~/.local/bin \
init --one-shot --force --apply $prompt lzima