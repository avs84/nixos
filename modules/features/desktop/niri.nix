{ self, inputs, ... }: {

  flake.nixosModules.niri = { pkgs, config,... }: {
    
    imports =[
      inputs.noctalia-greeter.nixosModules.default
    ];
    
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };    

    environment.systemPackages = [
      pkgs.noctalia-greeter
      ];
  

    services.displayManager.noctalia-greeter = {
        enable = true;
        settings = {
          cursor.size = 24;
          keyboard.layout = "us";
        };
        # cursorTheme = {
        #   package = pkgs.bibata-cursors;
        #   name = "Bibata-Modern-Ice";
        # };
      };

      # NixOS otherwise injects a stripped PATH via Environment= on the niri.service
      # unit which shadows the imported user-manager PATH. Disabling the default
      # lets niri inherit the full PATH set up by niri-session
      systemd.user.services.niri.enableDefaultPath = false;
  };

  perSystem = { pkgs, lib, self', ... }:
  let
    noctalia = lib.getExe self'.packages.myNoctalia;
  in {
    packages.myNiri = inputs.wrappers.wrappers.niri.wrap {
      inherit pkgs;

      settings = {
        spawn-at-startup = [ noctalia ];

        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

        input.keyboard.xkb.layout = "us";

        layout.gaps = 5;

        binds = {
          "Mod+T".spawn-sh = lib.getExe pkgs.alacritty;
          "Mod+Q".close-window = _: { };
          "Mod+S".spawn-sh = "${noctalia} ipc call launcher toggle";
        };
      };
    };
  };
}