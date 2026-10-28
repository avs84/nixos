{ ... }:{

  flake.nixosModules.productivity = {pkgs, ...}:{


    environment.systemPackages = with pkgs; [
      protonmail-desktop
      capacities
    ];

  };}