{ home, pkgs, ... }: home {
	home.packages = with pkgs; [
		unzip
		tree
		gping
	];
}
