Vim Configuration
=================

## Vundle version
no nix install (because of Fedora Silverblue). System vim, resp. flathub
version, plugins managed by Vundle


## nix branch
Most Vim plugins here are installed with `vimEnv` in `vimEnv.nix`. Non-nix packages can
be managed in vim-native `pack/` (since Vim 8) using `git submodule`. After
cloning execute `git submodule init` and `git submodule update`. 

### Steps to install nix version

-   build and install the nix env:
    `nix-env -f ./vimEnv.nix -i vimEnv`

-   clone and activate the git submodules in `pack/hbunke/start`:
    `git submodule update --init`


MOTE: vimEnv.nix seems to works under NixOS only. For other OS use vimenv2.nix
(`nix-env -f ./vimenv2.nix -i vimEnv`)
