# nix env for Vim. Most of used plugins are installed here, only those not
# available in nixpkgs are managed in ./pack/hbunke/start/ (Vim 8!) as git
# submodules

# install with nix-env -f vimEnv.nix -i vimEnv

# NOTE: this approach seems to work unter NixOS only. For other OS try to use
# vimenv2.nix. Vice versa the latter does not work with NixOS  :-(

with import <nixpkgs> {};
buildEnv {
  name = "vimEnv";
  paths = [ 
      # UPDATE: flake8 seems to work when installing it in pack/... (vim8)
        vim
      #  vim_configurable
        python27Full
        ctags
        ack
        ag
        python27Packages.flake8
        python27Packages.jedi 
        vimPlugins.ctrlp
        vimPlugins.nerdtree
        vimPlugins.tagbar
        vimPlugins.taglist
        vimPlugins.Syntastic
        vimPlugins.pluginnames2nix
        vimPlugins.vim-jinja
        vimPlugins.vim-nerdtree-tabs
        #vimPlugins.vim-buffergator
        vimPlugins.fugitive
        vimPlugins.vim-scala
        vimPlugins.airline
        vimPlugins.vim-colorschemes
        vimPlugins.vim-airline-themes
        vimPlugins.The_NERD_Commenter
        vimPlugins.gruvbox  
        vimPlugins.vim-indent-object
        vimPlugins.vim-markdown
        vimPlugins.CSApprox
        vimPlugins.YouCompleteMe
        vimPlugins.haskell-vim
       # vimPlugins.vim-dispatch

      ];
}

