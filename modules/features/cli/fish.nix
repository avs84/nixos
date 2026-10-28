{ ... } : {

  flake.nixosModules.fish = { config, lib, pkgs, ...}:
with lib; let
  cfg = config.features.cli.fish;
in
{
  options.features.cli.fish.enable = mkEnableOption "enable extended fish configuration";

  config = mkIf cfg.enable {
    programs.fish = {
      enable = true;
      loginShellInit = ''
        set -x NIX_PATH nixpkgs=channel:nixos-unstable
        set -x NIX_LOG info

        end
      '';
      shellAbbrs = {
        ".." = "cd ..";
        "..." = "cd ../..";
        ls = "eza";
        nrs-vm = "sudo nixos-rebuild switch --flake ~/.nixos-dotfiles#avs-vm";
      };
    };
  };
}

}