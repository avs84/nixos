{ inputs, ... } :{

  flake.nixosModules.services = {pkgs, ...}:{

    imports = inputs.nix-flatpak.nixosModules.nix-flatpak;

    services = {
      flatpak = {
        enable = true;
        update.auto = {
          enable = true;
          onCalendar = "weekly";
        };
        extraFlatpakRepos = {
          geforcenow = {
            url = "https://international.download.nvidia.com/GFNLinux/flatpak/geforcenow.flatpakrepo";
          };
        };
      };
      printing.enable = true;

      power-profiles-daemon.enable = true;
      upower.enable = true;

    };

    hardware.bluetooth.enable = true;

  };
}