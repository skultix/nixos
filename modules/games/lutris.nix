{ home, pkgs, lib, config, ... }: let
gamecfg = config.cfg.games;
in {
	options = {
		cfg.games.lutris = {
			enable = lib.mkOption { default = gamecfg.enable; };
		};
	};

	config = lib.mkIf gamecfg.lutris.enable (home {
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
	});
}
