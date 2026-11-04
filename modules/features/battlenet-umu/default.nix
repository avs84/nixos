{...}:{

  flake.NixosModules.battlenet-umu = {pkgs, ...}:
  
let
	wow = "Program Files (x86)/World of Warcraft";
	addonFolder = "Interface/Addons";
in {

imports = [inputs.battlenet-umu.nixosModules.battlenet-umu];

programs.battlenet-umu = {
	enable = true;
	games = [
		{ name = "Battle.net"; }
		{
			name = "Heroes of the Storm";
			path = "Program Files (x86)/Heroes of the Storm/Support64/HeroesSwitcher_x64.exe";
		}
		{
			name = "World of Warcraft";
			path = "${wow}/_retail_/Wow.exe";
		}
		{
			name = "WoW: Classic";
			path = "${wow}/_classic_era_/WowClassic.exe";
		}
	];
	addons = {
		enable = true;
		tokens = {
			wagoAddons = "SECRET";
		};
		versions = [
			{
				name = "era";
				addonDir = "${wow}/_classic_era_/${addonFolder}";
				flavour = "vanilla_classic";
				addons = [
					"github:Peterodox/YUI-Dialogue"
					"github:Total-RP/Total-RP-3"
					"github:DustinChecketts/VendorPricePlus"
				];
			}
		];
	};

  };
  };
}