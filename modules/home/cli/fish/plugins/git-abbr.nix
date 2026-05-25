{ pkgs, ... }: {
	programs.fish = {
		shellAbbrs = {
			gds = "git diff --staged";
		};

		plugins = [
			{ name = "git-abbr"; src = pkgs.fishPlugins.git-abbr.src; }
		];
	};
}
