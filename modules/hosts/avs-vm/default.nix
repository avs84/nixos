{self, inputs, ...}: {

  flake.nixosConfigurations.avs-vm = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      avsvmConfiguration
      system
      tools
      gaming
      productivity
      hyprland
      cli
      fish
      neovim
    ];

  };

}
