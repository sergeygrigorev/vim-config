# How to use

Add `[[ -f ~/user.bashrc ]] && source ~/user.bashrc` to your `~/.bashrc` file.

You may need to add `source ~/.bashrc` to your `~/.bash_profile` file.

Execute `install.sh` script. It will figure out what type of shell is used and generate the configuration accordingly.

Configuration will be installed to `~/user.bashrc` file.

You can create `~/local.bashrc` file to add machine-specific configuration.

It will also install configuration that can be copied to servers into `~/server-config/` directory if it exists.

Configuration can be updated using `df-install` alias.
