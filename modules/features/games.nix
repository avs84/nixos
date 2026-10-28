{ ... }:{

  flake.nixosModules.games = {...}:{

    environment.systemPackages = with pkgs; [
      steam
    ];
  };
}