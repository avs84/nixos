{ ... }:{

  flake.nixosModules.productivity = {pkgs, ...}:
  let 
    modules = with self.nixosModules; [
      # Add your modules here
      davinci
    ];
  in {
    imports = modules;


    environment.systemPackages = with pkgs; [
      protonmail-desktop
      capacities
      # bambu-studio
      onlyoffice-desktopeditors
    ];

  };}