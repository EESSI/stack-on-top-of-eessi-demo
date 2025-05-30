#!/bin/bash

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <easyconfig or easystack>"
  exit 1
fi

module purge
export EESSI_REPOS_CFG_DIR_OVERRIDE=~/stack-on-top-of-EESSI/repos.cfg

~/software-layer/eessi_container.sh --mode run -r webinar-demo,access=rw -r software.eessi.io -b ~/software-layer,$PWD -- ./install-on-top-of-EESSI.sh $*
