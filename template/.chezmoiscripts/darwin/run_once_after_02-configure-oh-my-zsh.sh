#!/bin/bash

set -eufo pipefail

if ! [ -d "~/.oh-my-zsh/" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Skipping .oh-my-zsh, already installed."
fi
