# Only run these settings once
if [ -z "$__Init_Demo_Modules" ]; then
    export __Init_Demo_Modules=1

    export MODULEPATH=/cvmfs/software.eessi.io/init/modules
    export LMOD_CASE_INDEPENDENT_SORTING="yes"
    export LMOD_PAGER="None"
    export LMOD_AVAIL_EXTENSIONS="no"
    export LMOD_DISABLE_SAME_NAME_AUTOSWAP="yes"
    # Use cache for load operations
    export LMOD_CACHED_LOADS=yes
    # Prevent user caches from being generated
    export LMOD_SHORT_TIME=86400
fi
