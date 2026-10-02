{ home, lib, pkgs, ... }: home {
	programs.steam.config.apps."1172620" = {
		name = "Sea of Thieves";
		wrappers = [
			(lib.getExe pkgs.gamemode)
		];
	};
}
