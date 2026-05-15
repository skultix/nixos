{ pkgs, ... }: {
	home.packages = with pkgs; [
		unzip
		tree
	];
}
