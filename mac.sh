#!/usr/bin/env bash

set -euo pipefail

function help {
  echo "
SYNOPSIS
       ./mac [-b BINARY]

OPTIONS

       -h        Help
       -b        The binary of the software/settings to install for example, alfred
       -l        List the software/settings that can be installed
"
}

BINARY=""
LIST=""

while [[ $# -gt 0 ]]; do
  case $1 in
    -b|--binary)
      BINARY="${2}"
      shift
      shift
      ;;
    -l|--list)
      LIST=true
      shift
      ;;
    -h|--help)
      help
      exit 0
      ;;
    -*|--*)
      echo "Unknown option ${1}"
      exit 1
      ;;
  esac
done

LIB=$(echo ~/Documents/scripts/bin/mac)

brew_install () {
    if brew ls --versions "$1" > /dev/null; then brew upgrade "$1" 2> /dev/null; else brew install "$1"; fi 
}

brew_install_cask () {
    if brew ls --versions --cask "$1" > /dev/null; then brew upgrade --cask "$1" 2> /dev/null; else brew install --cask "$1"; fi
}

if [[ ${LIST} == true ]]
then
  for F in $LIB/*
  do
    echo "$(echo $F | sed 's|'$LIB'/||g' | sed 's|\.sh||g')"
  done
  exit
fi

if [[ ! -z ${BINARY} ]]
then
  echo "Check for $(echo $BINARY | sed 's|'$LIB'/||g' | sed 's|\.sh||g')" 
  source $LIB/${BINARY}.sh
  exit
fi

for F in $LIB/*
do
  echo "Check for $(echo $F | sed 's|'$LIB'/||g' | sed 's|\.sh||g')" 
  source $F
done

echo Finished
