{...}:{

  flake.nixosModules.users = {...}:{
    users.users.avs = {
    initialHashedPassword = "$y$j9T$p5y5idfLEblB52Q732Dwp0$ZshIFYYtTEUybryILLtmLIcWv0EXvTwQaLsCTVwF3r/";
    isNormalUser = true;
    description = "avs";
    extraGroups = [ "networkmanager" "wheel" "flatpak"];
    openssh.authorizedKeys.keys =[
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDTD2e2wsveGCSIGj7YMSDmcwUOrNuxpQXi+skACP7WCN3u8Jah1qMggVJWaEssaDAlljg90y8A856aKLMIiSmi578i0AdDSRRcT7m8CoSPVqFF8V8roollkpNRfzTRd5zHn5FdXAIu4Xo/6jSMzt8IcPzftujaWovBMgLqMtVZ52AJnT4OKYO4bF47cmOedhPg7DwbdQNZuIV4x7mb0V7JfCbKbirhCZQBUWknL3EFYNcaMLbb/259l7w+Zh349vnA5yx4fULzEaYX7npWbgbWX1lNP1mk0dSDZK70Eo6DVrM0gdCWHUmgLzgNu+n2v9kOchQoAY6F5jlmJDxgHmHcWmMUe2XO96+CqU/Vhso0tNSWmkzVCCdzGgtN0BaQjYybiWEjJG6Vok1Nx9CoG15ieDrAxS6ccW10KRcdRc3kvYExuPsKbSnAFQz5QLRNXnc6/b8sfOFs9ewgXzAh+YOCrwRiqh5NlguY4WneRdFghnJK6uhebFB0v9ZjuFC4JtU= nixos-vm
"
    ];
  }
}