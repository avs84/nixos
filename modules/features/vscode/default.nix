{... }:{

  flake.nixosModules.vscode = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      vscode
      (vscode-with-extensions.override {
        vscodeExtensions = with vscode-extensions; [
          bbenoist.nix
          ms-python.python
          anthropic.claudecode
        ];
      })
    ];
  };
}