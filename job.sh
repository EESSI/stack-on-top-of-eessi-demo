#!/bin/bash

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <easyconfig or easystack>"
  exit 1
fi

module purge
export EESSI_REPOS_CFG_DIR_OVERRIDE=~/stack-on-top-of-eessi-demo/repos.cfg

# For the demo, we cache the container image in the home directory to prevent it from being redownloaded for every run
if [[ ! -f ~/build-node_debian11.sif ]]; then
    apptainer pull docker://ghcr.io/eessi/build-node:debian11
fi

~/software-layer/eessi_container.sh --mode run -c ~/build-node_debian11.sif -r webinar-demo,access=rw -r software.eessi.io -b ~/software-layer,$PWD -- ./build-on-top-of-EESSI.sh $*
