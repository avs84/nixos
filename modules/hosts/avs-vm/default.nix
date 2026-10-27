{self, inputs, ...}: {

  flake.nixosConfiguration.avs = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      avsvmConfiguration
      system
    ];

  };

}
