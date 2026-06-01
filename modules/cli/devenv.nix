{ home, pkgs, ... }: home {
	home.packages = with pkgs; [
		devenv
	];

	programs.fish.interactiveShellInit = ''
	devenv hook fish | source
	'';
}
