{ ... } :{

  flake.nixosModules.services = {pkgs, ...}:{

    services = {
      flatpak.enable = true;
      printing.enable = true;

      power-profiles-daemon.enable = true;
      upower.enable = true;

    };

    hardware.bluetooth.enable = true;

  };
}