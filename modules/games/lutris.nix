{ home, pkgs, lib, config, ... }: let
gamecfg = config.cfg.games;
in lib.mkIf gamecfg.lutris.enable (home {
	programs.lutris = {
		enable = true;

		extraPackages = with pkgs; [
			winetricks
			protontricks
			gamescope
			gamemode
			umu-launcher
		];
		steamPackage = config.programs.steam.package;
		# protonPackages = with pkgs; [ proton-ge-bin ];
		# defaultWinePackage = pkgs.proton-ge-bin;
	};
})
