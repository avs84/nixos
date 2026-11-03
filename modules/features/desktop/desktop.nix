{self, ...}: {
  flake.nixosModules.desktop = {pkgs, ...}: let
    selfpkgs = self.packages."${pkgs.system}";
  in {
    imports = [
    ];

    programs.niri.enable = true;
    programs.niri.package = selfpkgs.niri;

    # preferences.autostart = [selfpkgs.quickshellWrapped];
    # preferences.autostart = [selfpkgs.noctalia-shell];

    environment.systemPackages = [
      selfpkgs.myNoctalia
    ];


   


  };
}