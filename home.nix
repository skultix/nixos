{ inputs, ... }: {
	imports = [
		inputs.flatpak.homeManagerModules.nix-flatpak
		inputs.steam-config.homeModules.default
	];

	home.stateVersion = "26.05";

	home.sessionVariables = {
		EDITOR = "nvim";
	};

	# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;
}
