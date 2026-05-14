{ lib, ... }: {
	options.cfg.programs = {
		terminal = lib.mkOption { type = lib.types.str; };
		launcher = lib.mkOption { type = lib.types.str; };
		file-manager = lib.mkOption { type = lib.types.str; };
		file-search = lib.mkOption { type = lib.types.str; };
		password-manager = lib.mkOption { type = lib.types.str; };
		system-monitor = lib.mkOption { type = lib.types.str; };
		lock = lib.mkOption { type = lib.types.str; };
		power-menu = lib.mkOption { type = lib.types.str; };
	};
}
