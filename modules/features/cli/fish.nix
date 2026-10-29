{ ... } : {

  flake.nixosModules.fish = {pkgs, ...}: {
    
    environment.systemPackages = with pkgs; [
      fishPlugins.done
      fishPlugins.fzf-fish
      fishPlugins.forgit
      fishPlugins.hydro
      fzf
      fishPlugins.grc
      grc
    ];

  programs.fish.enable = true;




    # programs.fish = {
    #   enable = true;
    #   loginShellInit = ''
    #     set -x NIX_PATH nixpkgs=channel:nixos-unstable
    #     set -x NIX_LOG info

    #     end
    #   '';
    #   shellAbbrs = {
    #     ".." = "cd ..";
    #     "..." = "cd ../..";
    #     ls = "eza";
    #   };
    # };

  };
}