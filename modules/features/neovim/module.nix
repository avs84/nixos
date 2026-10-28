{ ... }: {

  flake.nixosModules.neovim = { pkgs, ... }: {

    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      configure = {
        packages.myPlugins = with pkgs.vimPlugins; {
          start = [
            
          ];
        };
      };
    };

  };

}

