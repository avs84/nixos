{ ... }: {

  flake.nixosModules.neovim = { pkgs, ... }: {

    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      configure = {
        packages.myPlugins = with pkgs.vimPlugins; {
          start = [
            vim-nix
            vim-fugitive
            vim-rhubarb
            vim-sensible
            vim-surround
            vim-repeat
            vim-commentary
            vim-abolish
            vim-easymotion
            vim-nerdtree
            vim-airline
            vim-airline-themes
          ];
        };
      };
    };

  };

}

