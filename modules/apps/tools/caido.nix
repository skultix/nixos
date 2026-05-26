{ home, pkgs, ... }: home {
	home.packages = with pkgs; [
		caido-desktop
	];
}
