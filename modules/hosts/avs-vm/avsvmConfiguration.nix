{...}: {

  #Make new nixos module available to flake-parts
  flake.nixosModules.avsvmConfiguration= {pkgs, ...}:{
    
    imports = [
      # Include the results of the hardware scan.
      ./_hardware-configuration.nix
    ];


    networking.hostName = "avs-vm"; # Define your hostname.

    # Enable the OpenSSH daemon.
    services.openssh = {
      enable = true;
      settings.PermitRootLogin = "no";
      allowSFTP = true;
    };

    programs.git = {
    settings.user = {
      name = "Arno van Schuijlenborgh";
      email = "avschuijl@gmail.com";
      };
    };
  };
}