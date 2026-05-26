{ home, pkgs, ... }: home {
	cfg.programs.file-search = "fsearch";

	home.packages = with pkgs; [
		fsearch
	];
}
