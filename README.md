Vim Configuration
=================

Most Vim plugins here are installed with vimEnv in `~/.nixpkgs`. Packages are
mirrored in default.nix to test or develop in nix-shell. Non-nix packages can
be managed in vim-native `pack/` (since Vim 8) using `git submodule`. After
cloning execute `git submodule init` and `git submodule update`. To install
python-jedi go to `pack/hbunke/start/jedi-vim` and do `git submodule update
--init` (jedi is an git submodule within the jedi repository). 
