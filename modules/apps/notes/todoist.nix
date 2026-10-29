{ home, pkgs, ... }: home {
	home.packages = with pkgs; [
		todoist-electron
	];
}
