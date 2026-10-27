{...}:{

  perSystem = {pkgs, ...}:{
    # Add per-system configuration here
    packages = {
      example = pkgs.hello;
    };
    };
}