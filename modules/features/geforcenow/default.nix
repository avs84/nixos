{ inputs, ... }:{

flake.nixosModules.geforcenow = { pkgs, ...}:{

    imports = [inputs.nix-flatpak.nixosModules.nix-flatpak];

    services.flatpak = {   
      packages = [
        {appId = "org.freedesktop.Platform/x86_64/24.08"; origin = "flathub";}
        { appId = "com.nvidia.geforcenow"; origin = "nvidia-geforcenow"; }  
      ];
    };

  };

}