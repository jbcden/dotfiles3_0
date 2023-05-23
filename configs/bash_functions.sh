#!/bin/bash

function kenv() {
  kubectl config current-context
}

function kubeshell {
  if [[ $# -eq 0 ]]; then
    echo "A context must be specified for this fuction to work"
    exit 1
  fi

  kubectl config use-context $1

  pod_id=$(kubectl get po | ag rails | head -1 | cut -d' ' -f1)

  kubectl exec -ti $pod_id -- bash
}

function g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status --branch
  fi
}

__git_complete g __git_main

function run_until_pass() {
  while true; do
    $1
    if [ $? -eq 0 ]; then
      break
    fi
  done
}

function run_until_fail() {
  while true; do
    $1
  done
}

last_migration(){
    vim db/migrate/$(ls db/migrate/ | sort | tail -1)
}

function docker-connect() {
  eval "$(docker-machine env $1)"
}

# docker-osx-dev
function docker_init() {
  eval "$(boot2docker shellinit)"
}

function docker_clean() {
  docker images -q --filter "dangling=true" | xargs docker rmi --force
  docker ps -q -a | xargs docker rm --force
}

function ag-rails() {
  ag $1 --ignore spec --ignore features --ignore doc --ignore db --ignore config
}

function adb_install_all() {
  adb devices | tail -n +2 | cut -sf 1 | xargs -I {} adb -s {} install $1
}

function source_bash() {
  source ~/.bashrc
}

function resque() {
  QUEUE=* bundle exec rake environment resque:work
}

function weather() {
  if [[ $# -gt 0 ]]; then
    curl -s wttr.in/"$@"
  else
    curl -s wttr.in
  fi
}
