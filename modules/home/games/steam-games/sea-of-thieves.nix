{ lib, pkgs, ... }: {
	programs.steam.config.apps.sea-of-thieves = {
		id = 1172620;
		launchOptions.wrappers = [
			(lib.getExe pkgs.gamemode)
		];
	};
}
