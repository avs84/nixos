{self, inputs, ...}: {

  flake.nixosConfigurations.avs-vm = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      avsvmConfiguration
      system
      tools
      games
      productivity
      hyprland
      cli
      fish
    ];

  };

}
