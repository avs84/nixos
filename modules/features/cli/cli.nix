{ self, ... }: {
  flake.nixosModules.cli = { pkgs, ... }: {

    environment.systemPackages = with pkgs; [
      eza
      btop
      coreutils
      zip
      tldr
    ];

    programs.yazi.enable = true;

    # Applies to bash and fish
    environment.shellAliases = {
      ls = "eza -la --icons --git";
      ll = "eza -l --icons --git";
      la = "eza -la --icons --git";
      tree = "eza --tree --icons";
    };
  };
}