{ inputs, ... }:{

flake.nixosModules.flatpaks = { pkgs, ...}:{

    imports = [inputs.nix-flatpak.nixosModules.nix-flatpak];

    services.flatpak = {   
      flatpak = {
        enable = true;
        update.auto = {
          enable = true;
          onCalendar = "weekly";
        };
        remotes = [
          { name = "flathub"; location = "https://dl.flathub.org/repo/flathub.flatpakrepo"; }
          {
          name = "nvidia-geforcenow";
          location = "https://international.download.nvidia.com/GFNLinux/flatpak/geforcenow.flatpakrepo";
        }];
        packages = [
          { appId = "com.nvidia.geforcenow"; origin = "nvidia-geforcenow"; }        ];
      };
    };
  };
}