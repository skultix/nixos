{ home, pkgs, ... }: let
proton-ge-version = pkgs.proton-ge-bin.version;
in home {
	programs.steam.config = {
		enable = true;
		closeSteam = true;
		defaultCompatTool = proton-ge-version;
	};
}
