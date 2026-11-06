{...}: {

  flake.nixosModules.git = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      git
    ];

    programs.git = {
      enable = true;
      config = {
        user.name = "Arno van Schuijlenborgh";
        user.email = "avschuijl@gmail.com";
      };
    };
  };
}