#!/bin/bash

# Process command-line argument(s)
arg=$1
if [[ -z $arg ]]; then
  echo "Usage: $0 <easyconfig or easystack>"
  exit 1
fi
# Check if the passed argument is an easyconfig or easystack
eb_cmd="eb --robot"
if [[ $arg = *.eb ]]; then
  eb_cmd="${eb_cmd} ${arg}"
elif [[ $arg = *.yml ]]; then
  eb_cmd="${eb_cmd} --easystack ${arg}"
  # We assume that the required EB version is encoded in the easystack filename like *eb-X.Y.Z*.yml
  eb_version=$(echo "${arg}" | sed 's/.*eb-\([0-9.]*\).*.yml/\1/g')
else
  echo "Don't know how to handle ${arg}; is this an easyconfig (*.eb) or easystack (*.yml)?"
  exit 1
fi

# Initialize EESSI
source /cvmfs/software.eessi.io/versions/2023.06/init/bash

# Load EESSI-extend and configure it for site installations
export EESSI_SITE_INSTALL=1
[[ ! -z ${eb_version} ]] && module load EasyBuild/${eb_version}
module load EESSI-extend
module list

# If the host_injections symlink points to a non-existing directory we may have to create it first
mkdir -p $(realpath /cvmfs/software.eessi.io/host_injections/)

# Run EasyBuild
echo "Running the following EasyBuild command: ${eb_cmd}..."
${eb_cmd}

# Enable the following if you want to configure an Lmod cache
# N.B.: it does not actually create the cache, this can be done best on a Stratum 0
~/software-layer/create_lmodrc.py ${EESSI_SITE_SOFTWARE_PATH}

# Create the tarball containing the new software installation(s)
host_injections_target=$(realpath /cvmfs/software.eessi.io/host_injections)
export cvmfs_repo=$(echo ${host_injections_target} | cut -f1,2,3 -d'/')
cvmfs_repo_subdir=${host_injections_target#${cvmfs_repo}}
[[ ! -z $cvmfs_repo_subdir ]] && cvmfs_repo_subdir="${cvmfs_repo_subdir#/}/" # remove leading slash, add trailing slash
tarball_name="eessi-${EESSI_VERSION}-software-linux-${EESSI_SOFTWARE_SUBDIR//\//-}-$(date +%s).tar.gz"
echo $TMP_IN_CONTAINER
./create_tarball.sh ${TMP_IN_CONTAINER:-/tmp} "${cvmfs_repo_subdir}${EESSI_VERSION}" "${EESSI_SOFTWARE_SUBDIR}" "${EESSI_ACCELERATOR_TARGET}" $PWD/${tarball_name}
