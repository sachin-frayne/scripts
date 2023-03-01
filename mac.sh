#!/usr/bin/env bash

set -euo pipefail

LIB=$(echo ~/Documents/scripts/bin/mac)

brew_install () {
    if brew ls --versions "$1" > /dev/null; then brew upgrade "$1" 2> /dev/null; else brew install "$1"; fi 
}

brew_install_cask () {
    if brew ls --versions --cask "$1" > /dev/null; then brew upgrade --cask "$1" 2> /dev/null; else brew install --cask "$1"; fi
}

for F in $LIB/*
do
  echo "Check for $(echo $F | sed 's|'$LIB'/||g' | sed 's|\.sh||g')" 
  source $F
done

echo Finished
