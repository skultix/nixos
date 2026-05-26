{ ... }: {
	nixpkgs.config.allowUnfree = true;
	environment.sessionVariables.NIXPKGS_ALLOW_UNFREE = 1;

	hm.nixpkgs.config.allowUnfree = true;
	hm.home.sessionVariables.NIXPKGS_ALLOW_UNFREE = 1;
}
