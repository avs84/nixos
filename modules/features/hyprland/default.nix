{ ... }:{

  flake.nixosModules.hyprland = {pkgs, ...}:{

    environment.systemPackages = with pkgs; [
      waybar
      networkmanagerapplet
      hyprpaper
      rofi
    ];

    # enable Hyprland
    programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };
  };
}
  