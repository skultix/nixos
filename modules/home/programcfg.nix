{ lib, ... }: let
str = "str";
opt = type: lib.mkOption { type = lib.types.${type}; };
in {
	options.cfg.programs = {
		terminal = opt str;
		launcher = opt str;
		file-manager = opt str;
		file-search = opt str;
		password-manager = opt str;
		system-monitor = opt str;
		lock = opt str;
		power-menu = opt str;
		clipboard-manager = opt str;
		notifications.toggle = opt str;
		notifications.clear = opt str;
	};
}
