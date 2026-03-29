{ inputs, ... }:
{
	imports = [
		(inputs.import-tree ./modules/home)
		inputs.steam-config.homeModules.default
		./modules/unfree.nix
	];

	home.username = "themarlstar";
	home.homeDirectory = "/home/themarlstar";

	home.stateVersion = "25.11"; # Don't change

	home.sessionVariables = {
		EDITOR = "nvim";
		MANPAGER = "nvim +Man!";
	};

	# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;
}
