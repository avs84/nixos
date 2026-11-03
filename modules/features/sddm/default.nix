{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.sddm = {
    pkgs,
    lib,
    ...
  }: {
    environment.systemPackages = [
      (pkgs.catppuccin-sddm.override {
        flavor = "mocha";
        font = "Fira Mono Nerd Font";
        fontSize = "11";
        background = null;
      })
    ];
    services.displayManager.sddm = {
      enable = true;
      theme = "catppuccin-mocha-mauve";
      wayland.enable = true;
      package = pkgs.kdePackages.sddm;
    };
  };
}
