{ self, inputs, ... }:{

  flake.nixosModules.hyprland = {lib, pkgs, ...}:
   let
      terminal      = lib.getExe pkgs.foot;
      fileManager   = lib.getExe pkgs.pcmanfm;
      menu          = "${lib.getExe pkgs.rofi} -show drun";
      reloadWaybar  = "pkill waybar; ${lib.getExe pkgs.waybar} &";
      waybar        = lib.getExe pkgs.waybar;
      hyprpaper     = lib.getExe pkgs.hyprpaper;
    in
  
  {
        
    # GTK_THEME / GTK_ICON_THEME in your Lua need these installed
    environment.systemPackages = with pkgs; [
      tokyonight-gtk-theme
      adwaita-icon-theme
    ];

    # enable Hyprland
    programs.hyprland = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myHyprland;
      withUWSM = true;
      xwayland.enable = true;
    };
  };

  perSystem = { pkgs, lib, self', ... }:
  let
    noctalia = lib.getExe self'.packages.myNoctalia;
  in {
    packages.myHyprland = inputs.wrappers.wrappers.hyprland.wrap {
      inherit pkgs;

      # your original Lua file; the module wires it up via --config
      configFile = ./hyprland.lua;

      # added to the wrapper's PATH, so foot/rofi/waybar etc. resolve
      # without relying on environment.systemPackages
      runtimePkgs = with pkgs; [
        waybar
        networkmanagerapplet
        hyprpaper
        rofi
        hypridle
      ];

      programs.noctalia.enable = true;
      
      # lets programs.hyprland register the login session from this package
      passthru.providedSessions = [ "hyprland" ];

      # plugins = [ pkgs.hyprlandPlugins.<name> ];

    };
  };
}


    