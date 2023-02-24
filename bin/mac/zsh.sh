#!/usr/bin/env bash

function git_clone() {
  if [[ ! -d $2 ]]; then
    git clone $1 $2
  fi
}

git_clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/custom/plugins/zsh-syntax-highlighting
git_clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/custom/plugins/zsh-autosuggestions
git_clone https://github.com/romkatv/powerlevel10k.git ~/.zsh/custom/plugins/powerlevel10k
