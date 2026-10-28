{...}: {
  # This module acts as a collection of other modules, for ease
  # of use. Adding another module to this list will import it
  # for all other modules that import this one.

	# Keep in mind that you cannot import this module alongside
	# any of its children. For example, importing this module and
	# the user module in the same block is the same as importing
	# the user module twice, leading to an error due to trying
	# to define the same user twice.

	# Collections should be used for static lists of modules, like
	# those that would make up a basic system, as seen here.

  # Define flake part nixosModule "system"
  flake.nixosModules.system = {self, inputs, ...}: let
    modules = with self.nixosModules; [
      users
      networking
      bootloader
      audio
      fonts
    ];
  in {
    imports = modules;


     # Set your time zone.
    time.timeZone = "Europe/Amsterdam";

    # Select internationalisation properties.
    i18n.defaultLocale = "nl_NL.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "nl_NL.UTF-8";
      LC_IDENTIFICATION = "nl_NL.UTF-8";
      LC_MEASUREMENT = "nl_NL.UTF-8";
      LC_MONETARY = "nl_NL.UTF-8";
      LC_NAME = "nl_NL.UTF-8";
      LC_NUMERIC = "nl_NL.UTF-8";
      LC_PAPER = "nl_NL.UTF-8";
      LC_TELEPHONE = "nl_NL.UTF-8";
      LC_TIME = "nl_NL.UTF-8";
    };

    system.stateVersion = "26.05";
  };
}
