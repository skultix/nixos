{ lib, pkgs, config, ... }: {
	options.cfg.hardware.fan-control.enable = lib.mkEnableOption "coolercontrol fan control";

	config = lib.mkIf config.cfg.hardware.fan-control.enable {
		boot.extraModulePackages = [ config.boot.kernelPackages.nct6687d ];
		boot.kernelModules = [ "nct6687" ];
		# claims the same chip, but read-only
		boot.blacklistedKernelModules = [ "nct6683" ];

		programs.coolercontrol.enable = true;

		environment.systemPackages = [ pkgs.lm_sensors ];

		environment.etc."coolercontrol/config.toml".source = ./coolercontrol.toml;
	};
}
