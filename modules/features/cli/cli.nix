 { ... } : {
 
 flake.nixosModules.cli = { self, pkgs, ...}:{
  modules = with self.nixosModules; [
  fish
  ];

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    extraOptions = [ "-l" "--icons" "--git" "-a" ];
  };

  environment.systemPackages = with pkgs; [
    btop
    coreutils
    zip
    tldr
  ];
 };
}