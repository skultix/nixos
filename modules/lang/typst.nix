{ home, pkgs, ... }: home {
	home.packages = with pkgs; [ typst ]
	++ (with pkgs.typstPackages; [
		wordometer # Word counts
		codly codly-languages # Fancy codeblocks
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
