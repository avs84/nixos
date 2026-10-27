{...}: {
  # Define flake part nixosModule "networking"
  flake.nixosModules.networking = {...}: {
    # Normal nix code
    networking = {
      # Enable networkManager
      networkmanager = {
        enable = true;
        
      };
      
    };

    # Disable "wait-online" target, makes connecting to network
    # async on boot
    systemd.services.NetworkManager-wait-online.enable = false;
  };
}
