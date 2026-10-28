{inputs, ...} :{

  perSystem = {system, ...}: {
    # Pre-defined object
    _module.args = {
      # Custom object, creating a new nixpkgs from a different input
      unstablePkgs = import inputs.nixpkgs-unstable {
        inherit system;
      };

      # Set users that are allowed to use the flake command
      trusted-users = [ "root" "avs" ];

      #setup garbage collection and optimisation
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };

      optimise.automatic = true;

      # Setting nixpkgs.config.free = true isn't possible through a normal nixosModule,
      # because of how inheritance works with nixos exclusive objects
      unfreePkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

  };
  };
}