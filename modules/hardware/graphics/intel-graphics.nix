{ lib, config, pkgs, ... }: {
	options = {
		cfg.hardware.intel-graphics = {
			enable = lib.mkEnableOption "enable intel grahpics drivers";
		};
	};

	config = lib.mkIf config.cfg.hardware.intel-graphics.enable {
		hardware.graphics.extraPackages = with pkgs; [
			intel-media-driver
			vpl-gpu-rt
			intel-compute-runtime
		];

		hardware.graphics.extraPackages32 = with pkgs; [
			driversi686Linux.intel-vaapi-driver
		];

		environment.sessionVariables = {
			LIBVA_DRIVER_NAME = "iHD";
		};

		hardware.enableRedistributableFirmware = true;

		services.xserver.videoDrivers = [ "modesetting" ];
	};
}
