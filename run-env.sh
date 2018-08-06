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

case "$1" in
  run)
    yellow "Levantando contenedor y dependencias"
    sudo docker build -t jenkins_propio .
    mkdir jenkins
    sudo docker run --name jenkins -p 7990:8080 -p 50000:50000 -v "$PWD"/jenkins:/var/jenkins_home jenkins_propio
    ;;
esac
