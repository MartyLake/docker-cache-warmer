#!/usr/bin/env bash

source logging.bash

debug "Clearing out log"
cat /dev/null >/job.log

function warm_host {
  debug "Warming host $1"
  echo "$ASSET_PATHS" | sed "s/^/$1/" | xargs -n 1 -I {} bash -c 'warm_file {}'
}
export -f warm_host

function warm_file {
  debug "Warming file $1"
  curl --user-agent 'cache warmer' -ksl $1 > /dev/null 2>&1
}
export -f warm_file

info "Started executing at $(date)"

ASSET_PATHS=$(curl -a 'cache warmer' -ksl $ASSET_PATH_MANIFEST_URL)
HOSTS_LIST=$($HOSTS_COMMAND)
echo $HOSTS_LIST | xargs -n 1 -I {} bash -c 'warm_host'

