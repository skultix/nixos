{ home, pkgs, ... }: home {
	home.packages = with pkgs; [
		unzip
		_7zip-zstd
	];
}
