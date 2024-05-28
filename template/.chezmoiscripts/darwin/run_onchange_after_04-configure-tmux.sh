#!/bin/bash

set -eufo pipefail

if ! [ -d "${ZSH_CUSTOM:-$HOME}/.tmux/plugins/tpm" ]; then
  mkdir -p "${ZSH_CUSTOM:-$HOME}/.tmux/plugins/tpm"
  git clone https://github.com/tmux-plugins/tpm ${ZSH_CUSTOM:-$HOME}/.tmux/plugins/tpm
else
  echo "Skipping tmux-plugin tpm, already installed."
fi