{ pkgs, lib, osConfig, ... }: let
gamecfg = osConfig.cfg.games;
in lib.mkIf gamecfg.lutris.enable {
	programs.lutris = {
		enable = true;
		extraPackages = with pkgs; [
			winetricks
			protontricks
			gamescope
			gamemode
			umu-launcher
		];
		steamPackage = osConfig.programs.steam.package;
		# protonPackages = with pkgs; [ proton-ge-bin ];
		# defaultWinePackage = pkgs.proton-ge-bin;
	};
}
