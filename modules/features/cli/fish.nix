{ ... } : {

  flake.nixosModules.fish = { config, lib, pkgs, ...}: {
        
    programs.fish = {
      enable = true;
      loginShellInit = ''
        set -x NIX_PATH nixpkgs=channel:nixos-unstable
        set -x NIX_LOG info

        end
      '';
      shellAbbrs = {
        ".." = "cd ..";
        "..." = "cd ../..";
        ls = "eza";
      };
    };

  };
}