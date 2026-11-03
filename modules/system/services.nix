{ ... } :{

  flake.nixosModules.services = {pkgs, ...}:{
    
    services = {
        flatpak.enable = true;
        printing.enable = true;

        displayManager.sddm.enable = true;
        displayManager.sddm.wayland.enable = true;
      };

  };


}