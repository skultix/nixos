{ lib, pkgs, config, ... }: {
	options.cfg.hardware.fan-control = {
		enable = lib.mkEnableOption "coolercontrol fan control";
		kernelModules.packages = lib.mkOption {
			default = [];
			type = lib.types.listOf lib.types.package;
		};
		kernelModules.modules = lib.mkOption {
			default = [];
			type = lib.types.listOf lib.types.str;
		};
		kernelModules.blacklist = lib.mkOption {
			default = [];
			type = lib.types.listOf lib.types.str;
		};
	};

	config = let
	cfg-path = ./configs/${config.networking.hostName}.toml;
	km = config.cfg.hardware.fan-control.kernelModules;
	in lib.mkIf config.cfg.hardware.fan-control.enable {
		boot = {
			extraModulePackages = km.packages;
			kernelModules = km.modules;
			blacklistedKernelModules = km.blacklist;
		};

		programs.coolercontrol.enable = true;

		environment.systemPackages = [ pkgs.lm_sensors ];

		environment.etc."coolercontrol/config.toml" = lib.mkIf (builtins.pathExists cfg-path) { source = cfg-path; };
	};
}
