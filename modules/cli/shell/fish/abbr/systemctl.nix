{ home, ... }: home {
	programs.fish.shellAbbrs = {
		sc = "sudo systemctl";
		scu = "systemctl --user";
	};
}
