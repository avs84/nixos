{self, inputs, ...}: {

  flake.nixosConfigurations.avs-vm = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      avsvmConfiguration
      system
      niri
      flatpaks
      # desktop
      tools
      # gaming
      productivity
      hyprland
    ];

  };

}
