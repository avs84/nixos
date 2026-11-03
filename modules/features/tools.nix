{self, ... }:{

  flake.nixosModules.tools = { pkgs, ...}:let

     modules = with self.nixosModules; [
      # Add your modules here
      myNeovim
      fish
      cli
    ];
  in {} {
    imports = modules;
  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
    environment.systemPackages = with pkgs; [
      alacritty
      foot
      git
      fastfetch
      pcmanfm
      git
    ];

    # Install firefox.
    programs.firefox.enable = true;

    programs.bash = {
      enable = true;
      shellAliases = {
        nrs = "sudo nixos-rebuild switch --flake ~/.nixos#avs-vm";
        nrs-vm = "nixos-rebuild switch --flake .#avs-vm --target-host avs@192.168.122.50 --sudo --ask-sudo-password";
      };
    };
  };
}
