{ self, ... }:{

  flake.nixosModules.productivity = {pkgs, ...}:
  let 
    modules = with self.nixosModules; [
      # Add your modules here
      davinci
      bambu-studio
    ];
  in {
    imports = modules;


    environment.systemPackages = with pkgs; [
      protonmail-desktop
      capacities
      onlyoffice-desktopeditors
      claude-code
      signal-desktop

    ];

  };
}