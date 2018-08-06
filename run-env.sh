#!/usr/bin/env bash

NORMAL=$(tput sgr0)
GREEN=$(tput setaf 2; tput bold)
YELLOW=$(tput setaf 3)
RED=$(tput setaf 1)

function red() {
  echo -e "$RED$*$NORMAL"
}

function green() {
  echo -e "$GREEN$*$NORMAL"
}

function yellow() {
  echo -e "$YELLOW$*$NORMAL"
}

function migrate() {
  yellow "DOING MIGRATIONS..."
  sudo docker-compose run web python3 ./proyecto/manage.py migrate
}

case "$1" in
  up)
    upContainers
    ;;
esac
