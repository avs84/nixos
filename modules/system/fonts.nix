{ ... }:{

  flake.nixosModules.fonts = {pkgs, ...}:{

    fonts.fonts = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];

  };

}