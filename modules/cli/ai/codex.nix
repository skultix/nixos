{ home, pkgs, ... }: home {
	programs.codex = {
		enable = true;
	};

	home.packages = with pkgs; [
		bubblewrap # used for sandboxing
	];
}
