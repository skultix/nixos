{ home, ... }: home {
	programs.fish.shellAbbrs = {
		dev = "nix develop -c $SHELL";
	};
}
