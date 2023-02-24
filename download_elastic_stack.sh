#!/usr/bin/env bash

POSITIONAL_ARGS=()

function help {
  echo "
SYNOPSIS
       ./download_elastic_stack.sh [-s SOFTWARE] [-v VERSION]

OPTIONS

       -h        Help
       -s        The name of the software for example, elasticsearch, kibana, ...
       -v        The version of the software for example, 7.17.1
"
}

BEAT=""

while [[ $# -gt 0 ]]; do
  case $1 in
    -s|--software)
      SOFTWARE="${2}"
      if [[ ${SOFTWARE} == *"beat"* ]]; then
        BEAT="beats/"
      fi
      shift
      shift
      ;;
    -v|--version)
      VERSION="${2}"
      shift
      shift
      ;;
    -h)
      help
      exit 0
      ;;
    -*|--*)
      echo "Unknown option ${1}"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("${1}")
      shift
      ;;
  esac
done


if [[ ! -d assets ]]
then
  mkdir assets
fi

if [[ ${SOFTWARE} = "elasticsearch" || ${SOFTWARE} = "kibana" ]]
then
  source bin/download_elastic_stack/download_es_kb.sh -v ${VERSION}
  exit
fi

if [[ ! -f assets/${SOFTWARE}-${VERSION}.tar.gz ]]
then
  wget https://artifacts.elastic.co/downloads/${BEAT}${SOFTWARE}/${SOFTWARE}-${VERSION}-darwin-x86_64.tar.gz -O assets/${SOFTWARE}-${VERSION}.tar.gz
  tar -xvf assets/${SOFTWARE}-${VERSION}.tar.gz -C assets
  mv assets/${SOFTWARE}-${VERSION}-darwin-x86_64 assets/${SOFTWARE}-${VERSION}
fi
