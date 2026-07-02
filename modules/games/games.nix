{ lib, ... }: {
	options = {
		cfg.games = {
			enable = lib.mkEnableOption "enable games";
		};
	};
}
