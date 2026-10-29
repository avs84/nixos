{ ... }:{

  flake.nixosModules.productivity = {pkgs, ...}:{


    environment.systemPackages = with pkgs; [
      protonmail-desktop
      capacities
      # bambu-studio
      onlyoffice-desktopeditors
    ];

  };}