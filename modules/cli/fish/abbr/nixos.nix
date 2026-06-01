{ home, ... }: home {
	programs.fish.shellAbbrs = {
		nrs = "sudo nixos-rebuild switch --flake ~/nixos#(hostname)";
	};
}
