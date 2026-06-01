{ home, pkgs, ... }: home {
	home.packages = with pkgs; [ typst ]
	++ (with pkgs.typstPackages; [
		wordometer
	])
	++ [ # LSP stuff
		tinymist
		websocat
	];

	# Used by typst-preview
	programs.firefox = {
		enable = true;
		profiles.typst-preview = {
			name = "typst-preview";
		};
	};
}
