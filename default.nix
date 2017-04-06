# XXX keep this synced with vimEnv in .nixpkgs/config.nix!
# actually not used, just for testing within shell
# use vimEnv in .nixpkgs/config 

with import <nixpkgs> {}; {
     viEnv = stdenv.mkDerivation {
       name = "vimshell";
       buildInputs = [
      #XXX jedi and geeknote do not work yet, since pathes are not known
      # vim-jedi and vim-flake8 are still in bundle, no vimPlugin yet
      # TODO: write nix config for vim-jedi and vim-flake8
      # UPDATE: flake8 seems to work when installing it in pack/... (vim8)
      # UPDATE: you can install jedi inside the jedi-vim package with:
      # 'git submodule update --init'
      # see jedi-vim/README.rst
        vim_configurable
        python27Full
        vimPlugins.ctrlp
        vimPlugins.nerdtree
        vimPlugins.tagbar
        vimPlugins.taglist
        vimPlugins.Syntastic
        vimPlugins.pluginnames2nix
        vimPlugins.vim-jinja
        vimPlugins.vim-nerdtree-tabs
        vimPlugins.vim-buffergator
        
        # geeknotedoes not work (anymore)
        #python27Packages.geeknote
        #python27Packages.jedi
        python27Packages.flake8
        vimPlugins.fugitive
        #vimPlugins.vim-scala
        
##        not in nixpkgs
        #vimPlugins.vim-geeknote
        vimPlugins.airline
        vimPlugins.vim-colorschemes
        vimPlugins.vim-airline-themes
        # XXX there's no nix package for ack.vim. Installed in .vim/pack/...
        ack
        ag
        vimPlugins.The_NERD_Commenter
        vimPlugins.gruvbox  
        vimPlugins.vim-indent-object

      ];

      pathsToLink = [ "/include" "/lib" ];
      #shellHook = ''
      #  export LIBRARY_PATH=/var/run/current-system/sw/lib;
      #  export C_INCLUDE_PATH=/var/run/current-system/sw/include;
      #  export LD_LIBRARY_PATH=/var/run/current-system/sw/lib;
      #  export PATH=$PATH:$PWD/bin;
       # mutt && exit;
      # '';

    };
}
