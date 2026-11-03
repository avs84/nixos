{ ... } :{

  flake.nixosModules.services = {pkgs, ...}:{
    
    services = {
        flatpak.enable = true;
        printing.enable = true;

        services.greetd = {
        enable = true;
        settings = {
          default_session = {
            command = "${pkgs.tuigreet}/bin/tuigreet --cmd niri-session";
            user = "avs";
          };

        };
      };
    };
  };
}