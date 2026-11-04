{ inputs, ... }:{

flake.nixosModules.geforcenow = { pkgs, ...}:{

    imports = [inputs.nix-flatpak.nixosModules.nix-flatpak];

    services.flatpak = {
     
     
      packages = [
       { appId = "com.nvidia.geforcenow"; origin = "nvidia-geforcenow"; }        ];
    };

  };

}