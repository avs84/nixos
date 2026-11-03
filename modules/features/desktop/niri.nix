{ self, inputs, ... }: {

  flake.nixosModules.niri = { pkgs, config,... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };

    environment.systemPackages = [
      pkgs.noctalia-greeter
      ];
  };

  perSystem = { pkgs, lib, self', ... }:
  let
    noctalia = lib.getExe self'.packages.myNoctalia;
  in {
    packages.myNiri = inputs.wrappers.wrappers.niri.wrap {
      inherit pkgs;

      settings = {
        outputs."eDP-1".scale = 1.9;
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