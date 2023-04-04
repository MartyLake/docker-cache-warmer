#!/usr/bin/env bash

function debug {
  if [[ ! -z $DEBUG ]]; then
    MSG="DEBUG $@"
    echo $MSG | tee -a /job.log
  fi
}
export -f debug

function info {
  MSG="$@"
  echo $MSG | tee -a /job.log
}
export -f info

debug "Debugging is enabled $(date)"

