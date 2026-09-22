{ home, pkgs, ... }: home {
	home.packages = with pkgs; [
		devenv
	];

	xdg.configFile."devenv/config.yaml".source = (pkgs.formats.yaml {}).generate "devenv config.yaml" {
		version = 1;
		shell.prompt_prefix = false;
		tui.statusline.enabled = true;
	};

	programs.fish.interactiveShellInit = ''
	devenv hook fish | source
	'';
}
