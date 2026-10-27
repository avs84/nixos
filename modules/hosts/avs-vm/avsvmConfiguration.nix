{...}: {

  #Make new nixos module available to flake-parts
  flake.nixosModules.avsvmConfiguration= {pkgs, ...}:{
    environment.systemPackages = with pkgs; [
      # Add packages here
      git
      neovim
    ];

    networking.hostName = "avs-vm"; # Define your hostname.

  };

}