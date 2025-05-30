# Demo scripts for building a software stack on top of EESSI

This project demonstrates how you could build a software stack on top of EESSI.

## Overview

### Scripts

`build.sh`: Main script that triggers a build for a given easyconfig or easystack file inside the EESSI build container
`install-on-top-of-eessi`: Script that runs inside the container, sets up the environment using EESSI-extend, and actually starts the build with EasyBuild.
`create_tarball.sh`: Script that will create a tarball of the software that was built in the container.

### Directories

`easystacks`: Dummy easystacks that can be fed to `build.sh`.
`profile.d_with_lmod`: Examples of scripts that can be used in `/etc/profile.d` for automatically setting up the EESSI environment with the system Lmod.
`profile.d_without_lmod`: Example of a script that can be used in `/etc/profile.d` for automatically setting up the EESSI environment without a system Lmod.
`repos.cfg`: Examples and instructions for making additional/custom CVMFS repositories available in the EESSI build container.
