{ pkgs, lib, config, ... }: {
	options = {
		cfg.hardware.rgb = {
			enable = lib.mkEnableOption "enable addressable RGB control";
		};
	};

	config = let
	rgb = config.cfg.hardware.rgb;
	in lib.mkIf rgb.enable {
		services.hardware.openrgb = {
			enable = true;
			package = pkgs.openrgb-with-all-plugins;
		};
	};
}
