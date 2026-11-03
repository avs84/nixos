{ self, inputs, ... }: {

  flake.nixosModules.noctalia = { pkgs, ... }: {
    programs.noctalia = {
      enable = true;
      systemd.enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNoctalia;
    };

    environment.systemPackages = [
      pkgs.noctalia-greeter
      ];
  };

  perSystem = { pkgs, ... }: {
    packages.myNoctalia = inputs.wrappers.wrappers.noctalia-shell.wrap {
      inherit pkgs;
      settings =
        (builtins.fromJSON
          (builtins.readFile ./noctalia.json)).settings;
    };
  };
}
