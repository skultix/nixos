{ lib, pkgs, config, ... }: {
	options.cfg.hardware.fan-control.enable = lib.mkEnableOption "coolercontrol fan control";

	config = lib.mkIf config.cfg.hardware.fan-control.enable {
		# MSI B650 boards hang their fan headers off a Nuvoton NCT6687-R, which
		# no in-tree driver handles, so without this nothing exposes a pwm file
		boot.extraModulePackages = [ config.boot.kernelPackages.nct6687d ];
		boot.kernelModules = [ "nct6687" ];
		boot.blacklistedKernelModules = [ "nct6683" ]; # claims the same chip, but read-only

		# nvidia fan control needs no opt-in; the daemon loads it at runtime
		programs.coolercontrol.enable = true;

		environment.systemPackages = [ pkgs.lm_sensors ];
	};
}
