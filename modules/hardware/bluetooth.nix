{ config, lib, ... }: {
	options.cfg.bluetooth = {
		enable = lib.mkEnableOption "enable bluetooth";
		blueman.enable = lib.mkOption { default = false; };
	};

	config = lib.mkIf config.cfg.bluetooth.enable {
		hardware.bluetooth = {
			enable = true;
		};

		services.blueman.enable = config.cfg.bluetooth.blueman.enable;
	};
}
