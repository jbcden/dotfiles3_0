#!/bin/bash

function worktree {
  local work_dirs=/Users/jchae/worktree
  local new_tree=$1
  local base_branch=$2
  echo $base_branch

  if [ -z $base_branch ]; then
    base_branch=origin/master
  fi

  echo $base_branch
  # git worktree add -b $new_tree $work_dirs/$new_tree

  # cd $work_dirs/$new_tree
}

# need to include the repo name as part of the directory name
# this will help avoid confusion when trying to locate feature branches and make it
# easier to implement working tree
function maintree {
  local workspace=/Users/jchae/md
  local repo_name=`basename "$PWD"`

  cd $workspace/$repo_name
}

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
