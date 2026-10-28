{ ... }:{

  flake.nixosModules.tools = {self, pkgs, ...}:{
  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
    modules = with self.nixosModules; [
      # Add your modules here
      cli
    ];
    
    environment.systemPackages = with pkgs; [
      alacritty
      foot
      git
      fastfetch
      neovim
      pcmanfm
      git
    ];

    # Install firefox.
    programs.firefox.enable = true;

    programs.bash = {
      enable = true;
      shellAliases = {
        nrs = "sudo nixos-rebuild switch --flake ~/.nixos-dotfiles#avs-vm";
        nrs-vm = "nixos-rebuild switch --flake .#avs-vm --target-host avs@192.168.122.50 --sudo --ask-sudo-password";
      };
    };
  };
}
