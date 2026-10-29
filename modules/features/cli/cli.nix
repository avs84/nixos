 { self, ... } : {
 
 flake.nixosModules.cli = { pkgs, ...}:{
  
  # modules = with self.nixosModules; [
  #   fish
  # ];

  environment.systemPackages = with pkgs; [
    eza
    btop
    coreutils
    zip
    tldr
  ];

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    extraOptions = [ "-l" "--icons" "--git" "-a" ];
  };
  
 };
}