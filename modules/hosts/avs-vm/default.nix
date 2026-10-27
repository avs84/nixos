{self, inputs, ...}: {

  flake.nixosConfigurations.avs = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      avsvmConfiguration
      system
    ];

  };

}
