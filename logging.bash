#!/usr/bin/env bash

debug() {
  if [[ ! -z $DEBUG ]]; then
    MSG="DEBUG $@"
    echo $MSG | tee -a /job.log
  fi
}

info() {
  MSG="$@"
  echo $MSG | tee -a /job.log
}

debug "Debugging is enabled $(date)"

