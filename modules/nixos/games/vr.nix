{ pkgs, config, lib, ... }: let
gamecfg = config.cfg.games;
vrcfg = gamecfg.vr;
mkDefaultOption = val: lib.mkOption { default = val; };
in {
	options.cfg.games.vr = {
		enable = lib.mkEnableOption "enable VR";

		monado = {
			enable = mkDefaultOption vrcfg.enable;
			defaultRuntime = mkDefaultOption (!vrcfg.wivrn.enable);
		};

		wivrn = {
			enable = mkDefaultOption vrcfg.enable;
			defaultRuntime = mkDefaultOption vrcfg.wivrn.enable;
		};

		xrizer.enable = mkDefaultOption true;

		sidequest.enable = mkDefaultOption false;
	};

	config = lib.mkIf vrcfg.enable {
		assertions = [{
			assertion = !(vrcfg.monado.defaultRuntime && vrcfg.wivrn.defaultRuntime);
			message = "you cannot set multiple default OpenXR runtimes!";
		}];

		environment.systemPackages = []
		++ lib.optional vrcfg.xrizer.enable pkgs.xrizer
		++ lib.optional vrcfg.sidequest.enable pkgs.sidequest
		;

		services.monado = lib.mkIf vrcfg.monado.enable {
			enable = true;
			defaultRuntime = (!vrcfg.wivrn.enable) || vrcfg.monado.defaultRuntime;
		};

		services.wivrn = lib.mkIf vrcfg.wivrn.enable {
			enable = true;
			openFirewall = true;
			steam = lib.mkIf gamecfg.steam.enable {
				package = config.programs.steam.package;
				importOXRRuntimes = true;
			};
			defaultRuntime = true;
		};
	};
}
