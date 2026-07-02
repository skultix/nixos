{ pkgs, config, lib, ... }: let
gamecfg = config.cfg.games;
vrcfg = gamecfg.vr;
mkDefaultOption = val: lib.mkOption { default = val; };
in {
	options.cfg.games.vr = {
		enable = lib.mkEnableOption "enable VR";

		monado = {
			enable = mkDefaultOption vrcfg.enable;
			defaultRuntime = mkDefaultOption true;
		};

		wivrn = {
			enable = mkDefaultOption vrcfg.enable;
		};

		xrizer.enable = mkDefaultOption true;

		sidequest.enable = mkDefaultOption false;
	};

	config = lib.mkIf vrcfg.enable {
		environment.systemPackages = []
		++ lib.optional vrcfg.xrizer.enable pkgs.xrizer
		++ lib.optional vrcfg.sidequest.enable pkgs.sidequest
		;

		services.monado = lib.mkIf vrcfg.monado.enable {
			enable = true;
			defaultRuntime = vrcfg.monado.defaultRuntime;
		};

		services.wivrn = lib.mkIf vrcfg.wivrn.enable {
			enable = true;
			openFirewall = true;
			steam = lib.mkIf gamecfg.steam.enable {
				package = config.programs.steam.package;
				importOXRRuntimes = true;
			};
		};
	};
}
