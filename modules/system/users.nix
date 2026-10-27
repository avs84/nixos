{...}:{

  flake.nixosModules.users = {...}:{
    users.users.avs = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "flatpak"];
      initialHashedPassword = "$y$j9T$p5y5idfLEblB52Q732Dwp0$ZshIFYYtTEUybryILLtmLIcWv0EXvTwQaLsCTVwF3r/";
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC0g6k7r8y+2J4x9Q6z5F0G9
  };
}