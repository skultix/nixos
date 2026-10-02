{ home, pkgs, ... }: home {
	home.packages = with pkgs; [
		positron-bin
	];
}
