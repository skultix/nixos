{ home, pkgs, ... }: {
	cfg.programs.file-search = "fsearch";
} // home {
	home.packages = with pkgs; [
		fsearch
	];
}
