{ lib, config, ... }: let
gamecfg = config.cfg.games;
in {
	options = {
		cfg.games.lutris = {
			enable = lib.mkOption { default = gamecfg.enable; };
		};
	};
}
