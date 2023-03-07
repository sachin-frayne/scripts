#!/usr/bin/env bash

set -euo pipefail

function help {
  echo "
SYNOPSIS
       ./download_es_kb.sh [-v VERSION]

OPTIONS

       -h        Help
       -v        The version of the software for example, 7.17.1
"
}

while [[ $# -gt 0 ]]; do
  case $1 in
    -v|--version)
      VERSION="${2}"
      shift
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

if [[ ! -f elasticsearch-${VERSION}.tar.gz ]]
then
    wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${VERSION}-darwin-x86_64.tar.gz -O assets/elasticsearch-${VERSION}.tar.gz
    tar -xvf assets/elasticsearch-${VERSION}.tar.gz -C assets
fi

if [[ ! -f kibana-${VERSION}.tar.gz ]]
then
    wget https://artifacts.elastic.co/downloads/kibana/kibana-${VERSION}-darwin-x86_64.tar.gz -O assets/kibana-${VERSION}.tar.gz
    tar -xvf assets/kibana-${VERSION}.tar.gz -C assets
    if [[ -d assets/kibana-${VERSION}-darwin-x86_64 ]]
    then
      mv assets/kibana-${VERSION}-darwin-x86_64 assets/kibana-${VERSION}
    fi
fi
