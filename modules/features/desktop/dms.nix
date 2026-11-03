{ self, inputs, ... }: {    

  flake.nixosModules.dms = { pkgs, ... }: {

    imports = [
      inputs.dms.nixosModules.dank-material-shell
    ];

    programs.dank-material-shell = {
      enable = true;
      # package = self.packages.${pkgs.stdenv.hostPlatform.system}.default;
    
      systemd = {
        enable = true;             # Systemd service for auto-start
        restartIfChanged = true;   # Auto-restart dms.service when dms-shell changes
      };
      
      # Core features
      enableSystemMonitoring = true;     # System monitoring widgets
      enableVPN = true;                  # VPN management widget
      enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
      enableAudioWavelength = true;      # Audio visualizer (cava)
      enableCalendarEvents = true;       # Calendar integration (khal)
        
    };
  };
}
