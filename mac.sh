#!/usr/bin/env bash

set -euo pipefail

LIB=$(echo ~/Documents/scripts/bin/mac)

brew_install () {
    brew list $1  > /dev/null || brew install $1
}

brew_install_cask () {
    brew list $1  > /dev/null || brew install --cask $1
}

for F in $LIB/*
do
  echo "Check for $(echo $F | sed 's|'$LIB'/bin/||g' | sed 's|\.sh||g')" 
  source $F
done

echo Finished
