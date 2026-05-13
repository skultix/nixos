{ ... }: {
	nixpkgs.config.allowUnfree = true;
	home.sessionVariables.NIXPKGS_ALLOW_UNFREE = 1;
}
