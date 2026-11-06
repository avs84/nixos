{
  moduleWithSystem,
  self,
  ...
}: {
  flake.nixosModules.davinci = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      davinci-resolve
    ];
  };
  perSystem = {inputs', ...}: {
    packages.davinci-resolve = inputs'.davinci.packages.default;
  };
}
