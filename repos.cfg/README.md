# CVMFS configuration for EESSI build container

Note that the example in this directory does not actually work, as the repository and Stratum 0 do not actually exist.
In order to add the configuration of your own CVMFS repository, update the `repos.cfg` file accordingly.

Also, prepare a directory named after your CVMFS repository, containing the following files:
 - the domain configuration file of your CVMFS repositories (in this example: `myrepo.myorg.tld/myorg.tld`);
 - the public key of your repository (in this example: `myrepo.myorg.tld/myrepo.myorg.tld.pub`);
 - a local CVMFS configuration file (`default.local`).

Make sure that the file organization matches the one in `repos.cfg`.
Finally, create a tarball of this directory using (e.g. `tar -czf repos.tgz myrepo.myorg.tld`),
where the name of the tarball should be the same as used for `config_bundle`.
