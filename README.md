Vim Configuration
=================

Most Vim plugins here are installed with `vimEnv` in `vimEnv.nix`. Non-nix packages can
be managed in vim-native `pack/` (since Vim 8) using `git submodule`. After
cloning execute `git submodule init` and `git submodule update`. To install
python-jedi go to `pack/hbunke/start/jedi-vim` and do `git submodule update
--init` (jedi is an git submodule within the jedi repository).

## Steps to install

-   build and install the nix env:
    `nix-env -f ./vimEnv.nix -i vimEnv`

-   clone and activate the git submodules in `pack/hbunke/start`:
    `git submodule update --init`

-   clone and activate python jedi rep:
    `cd pack/hbunke/start/jedi-vim && git submodule update --init`
