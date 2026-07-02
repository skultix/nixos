{ ... }: {
	nix = {
		optimise = {
			automatic = true;
			dates = "2:00";
		};
		settings.auto-optimise-store = true;
	};
}
