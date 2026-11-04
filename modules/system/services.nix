{ inputs, ... } :{

  flake.nixosModules.services = {pkgs, ...}:{

    imports = [inputs.nix-flatpak.nixosModules.nix-flatpak];

    services = {
      flatpak = {
        enable = true;
        update.auto = {
          enable = true;
          onCalendar = "weekly";
        };
        remotes = [{
          name = "nvidia-geforcenow";
          location = "https://international.download.nvidia.com/GFNLinux/flatpak/geforcenow.flatpakrepo";
        }];
        packages = [
          "org.freedesktop.Platform/x86_64/24.08"
          { origin = "nvidia-geforcenow"; appId = "com.nvidia.geforcenow"; }
        ];
      };
      printing.enable = true;

      power-profiles-daemon.enable = true;
      upower.enable = true;

    };

    hardware.bluetooth.enable = true;

  };
}