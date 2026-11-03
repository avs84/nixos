{ ... } :{

  flake.nixosModules.services = {pkgs, ...}:{

    services = {
      flatpak.enable = true;
      printing.enable = true;

    };
  };
}