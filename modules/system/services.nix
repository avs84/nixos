{ inputs, ... } :{

  flake.nixosModules.services = {pkgs, ...}:{
    
    services = {
      flatpak.enable = true;
      printing.enable = true;

      displayManager.noctalia-greeter = {
        enable = true;
        settings = {
          cursor.size = 24;
          keyboard.layout = "us";
        };
        cursorTheme = {
          package = pkgs.bibata-cursors;
          name = "Bibata-Modern-Ice";
        };
      };

      # greetd = {
      #   enable = true;
      #   settings = {
      #     default_session = {
      #       command = "${pkgs.tuigreet}/bin/tuigreet --cmd niri-session";
      #       user = "avs";
      #     };
      #   };
      # };
    };
  };
}