{ lib, config, ... }: {
	options = {
		cfg.hardware.nvidia = {
			enable = lib.mkEnableOption "enable NVIDIA GPU drivers";
		};
	};

	config = lib.mkIf config.cfg.hardware.nvidia.enable {
		hardware.nvidia = {
			modesetting.enable = true;
			powerManagement.enable = true;
			open = true;
			nvidiaSettings = true;
			package = config.boot.kernelPackages.nvidiaPackages.stable;
		};

		services.xserver.videoDrivers = ["nvidia"];
	};
}
