{... }:{

  flake.nixosModules.vscode = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      vscode
    ];
  };

    programs.vscode.extensions = [ 
      bbenoist.nix
      ms-python.python
      anthropic.claudecode

    ];
}