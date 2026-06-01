{ home, pkgs, ... }: home {
	home.packages = with pkgs; [
		fish-lsp
	];
}
