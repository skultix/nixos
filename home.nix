{ inputs, ... }:
{
	imports = [
		inputs.flatpak.homeManagerModules.nix-flatpak
		inputs.steam-config.homeModules.default
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
