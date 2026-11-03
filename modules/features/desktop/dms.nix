{ self, inputs, ... }: {    

  flake.nixosModules.dms = { pkgs, ... }: {
    programs.dms = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.default;
    };
  };
}
