# nix env for Vim. Most of used plugins are installed here, only those not
# available in nixpkgs are managed in ./pack/hbunke/start/ (Vim 8!) as git
# submodules

# install with nix-env -f vimenv2.nix -i vim

# NOTE: this approach does not work under NixOS! Use vimEnv.nix instead



with import <nixpkgs> {};

vim_configurable.customize {
    name = "vim";
   
    # to avoid putting the whole vimrc here simply source it
    vimrcConfig.customRC = ''
    source $HOME/.vim/vimrc
    '';
    
    # Use the default plugin list shipped with nixpkgs
    vimrcConfig.vam.knownPlugins = pkgs.vimPlugins;
    vimrcConfig.vam.pluginDictionaries = [
        { names = [
            # Here you can place all your vim plugins
            # They are installed managed by `vam` (a vim plugin manager)
            "Syntastic"
            "ctrlp"
	        "gruvbox"
            "airline"
            "nerdtree"
            "tagbar"
            "taglist"
          #  "pluginnames2nix"
            "vim-jinja"
            "vim-nerdtree-tabs"
            "fugitive"
            "vim-scala"
            "vim-colorschemes"
            "vim-airline-themes"
            "The_NERD_Commenter"
            "vim-indent-object"
            "vim-markdown"
          #  "vim-pandoc"
          #  "vim-pandoc-syntax"
            "CSApprox"
          #  "YouCompleteMe"
            "haskell-vim"
            "vim-colors-solarized"
           # "vim-latex-live-preview"
             "ack-vim"
             "vim-flake8"
             "vim-addon-nix"

        ]; }
    ];
}
