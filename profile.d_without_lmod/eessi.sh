source /cvmfs/software.eessi.io/versions/2023.06/init/bash
export LMOD_CASE_INDEPENDENT_SORTING="yes"
export LMOD_PAGER="less"
export LMOD_AVAIL_EXTENSIONS="no"
export LMOD_DISABLE_SAME_NAME_AUTOSWAP="yes"
# Use cache for load operations
export LMOD_CACHED_LOADS=yes
# Prevent user caches from being generated
export LMOD_SHORT_TIME=86400

if [ ! -z $EESSI_SITE_SOFTWARE_PATH ] && [ -f ${EESSI_SITE_SOFTWARE_PATH}/.lmod/lmodrc.lua ]; then
    export LMOD_RC=${LMOD_RC}:${EESSI_SITE_SOFTWARE_PATH}/.lmod/lmodrc.lua
fi
