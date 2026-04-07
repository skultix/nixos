{ pkgs, ... }: {
	home.packages = with pkgs; [
		nil # nil lsp
	];
}
