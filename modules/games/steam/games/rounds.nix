{ home, pkgs, ... }: home {
	home.packages = with pkgs; [
		gale # thunderstore
	];
}
