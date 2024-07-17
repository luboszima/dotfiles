#!/usr/bin/env bash

set -eufo pipefail

if ! [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
else
  echo "Skipping powerlevel10k, already installed."
fi

echo "Set ZSH as a default shell"
sudo chsh -s $(which zsh)