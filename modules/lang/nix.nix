{ home, pkgs, ... }: home {
	home.packages = with pkgs; [
		nil # nil lsp
	];
}
