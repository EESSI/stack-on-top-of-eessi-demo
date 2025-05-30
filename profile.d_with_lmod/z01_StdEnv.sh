# See https://lmod.readthedocs.io/en/latest/070_standard_modules.html
if [ -z "$__Init_Default_Modules" ]; then
    export __Init_Default_Modules=1;

    ## ability to predefine elsewhere the default list
    #LMOD_SYSTEM_DEFAULT_MODULES=${LMOD_SYSTEM_DEFAULT_MODULES:-"StdEnv"}
    LMOD_SYSTEM_DEFAULT_MODULES=${LMOD_SYSTEM_DEFAULT_MODULES:-"EESSI/2023.06"}
    export LMOD_SYSTEM_DEFAULT_MODULES
    module --initial_load --no_redirect restore
    # If there's a lmodrc.lua for the site installations (used to define a cache), add it to $LMOD_RC
    if [ ! -z $EESSI_SITE_SOFTWARE_PATH ] && [ -f ${EESSI_SITE_SOFTWARE_PATH}/.lmod/lmodrc.lua ]; then
        export LMOD_RC=${LMOD_RC}:${EESSI_SITE_SOFTWARE_PATH}/.lmod/lmodrc.lua
    fi
else
    module refresh
fi
