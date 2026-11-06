{
  moduleWithSystem,
  self,
  ...
}: {
  flake.nixosModules.davinci = moduleWithSystem ({self', ...}: {
    environment.systemPackages = with self'.packages; [
      davinci-resolve
    ];
  });
  perSystem = {inputs', ...}: {
    packages.davinci-resolve = self'.davinci.packages.default;
  };
}
