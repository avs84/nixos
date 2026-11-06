{ inputs, ... } :{

  flake.nixosModules.services = {pkgs, ...}:{

    imports = [inputs.nix-flatpak.nixosModules.nix-flatpak];

    services = {
      printing.enable = true;

      power-profiles-daemon.enable = true;
      upower.enable = true;
      teamviewer.enable = true;
    };

    hardware.bluetooth.enable = true;

  };
}