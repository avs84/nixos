{... }:{

  flake.nixosModules.bambu-studio = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      bambu-studio
    ];
  };
}