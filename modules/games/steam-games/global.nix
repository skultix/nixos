{ home, pkgs, ... }: let
proton-ge-version = pkgs.proton-ge-bin.version;
inhome {
	programs.steam.config = {
		enable = true;
		closeSteam = true;
		defaultCompatTool = proton-ge-version;
	};
}
