{
  description = "AVS NixOS configuration";

  inputs = { 
    # Latest stable nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    # Unstable nixpkgs
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Flake parts utils
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    #Nix Wrapper Modules
    wrappers.url = "github:nix-community/nix-wrapper-modules";
    # wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";

    #Neovim modular setup
    nvf.url = "github:notashelf/nvf";

    #noctalia greeter
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #Nix flatpak
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
     
    # Catppuccin theme
    catppuccin.url = "github:catppuccin/nix";

    # Cachyos kernel
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
  };

  # Default import-tree output
  outputs = inputs:
  # Pass all inputs to outputs
    inputs.flake-parts.lib.mkFlake {
      # Call mkFlake from flake-parts module
      inherit inputs; # Inherit inputs (required to get correct arch for self')
    } (inputs.import-tree ./modules); # Pass in all modules using import-tree
}
