{ home, ... }: home {
	# nicer-looking pager
	programs.delta = {
		enable = true;
		enableGitIntegration = true;
		options = {
			side-by-side = true;
		};
	};
}
