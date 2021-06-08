#!/bin/bash
SUPERTAGET=""

function system() {
  ## ref.: https://stackoverflow.com/a/8597411
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    SUPERTAGET="sudo"
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    SUPERTAGET=""
  elif [[ "$OSTYPE" == "cygwin" ]]; then
    # POSIX compatibility layer and Linux environment emulation for Windows
    SUPERTAGET=""
  elif [[ "$OSTYPE" == "msys" ]]; then
    # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
    SUPERTAGET=""
  elif [[ "$OSTYPE" == "win32" ]]; then
    # I'm not sure this can happen.
    SUPERTAGET=""
  elif [[ "$OSTYPE" == "freebsd"* ]]; then
    SUPERTAGET="sudo"
  else
    # Unknown.
    echo "unknown os env. ---> $OSTYPE"
  fi
}

function stop() {
  "$SUPERTAGET" docker-compose -f docker-compose.yml down
  sleep 3
}

function main() {
  system
  stop
}

main
