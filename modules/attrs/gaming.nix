{self, inputs, ...}: {
  flake.nixosModules.gaming = {
    pkgs,
    lib,
    ...
  }: let
     modules = with self.nixosModules; [
      # Add your modules here
      steam
    ];
  in {
    imports = modules; 

    hardware.graphics.enable = lib.mkDefault true;

    programs = {
      gamemode.enable = true;
      gamescope.enable = true;
    };

    environment.systemPackages = with pkgs; [
      lutris
      dxvk

      gamescope
      protonup-qt
      mangohud

      r2modman

      heroic
      lutris

      er-patcher
      bottles

    ];

    nix.settings = {
      substituters = ["https://nix-gaming.cachix.org"];
      trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
    };
  };

}
