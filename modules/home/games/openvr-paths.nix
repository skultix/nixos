{ config, osConfig, lib, pkgs, ... }: let
gamecfg = osConfig.cfg.games;
vrcfg = gamecfg.vr;
steam = "${config.xdg.dataHome}/Steam";

onlyif = cond: val: if cond then val else null;
in lib.mkIf vrcfg.enable {
	xdg.configFile."openvr/openvrpaths.vrpath".text = (builtins.toJSON {
		version = 1;
		jsonid = "vrpathreg";

		external_drivers = null;
		config = onlyif gamecfg.steam.enable [ "${steam}/config" ];
		log = onlyif gamecfg.steam.enable [ "${steam}/logs" ];

		runtime = onlyif vrcfg.xrizer.enable [
			"${pkgs.xrizer}/lib/xrizer"
		];
	});
}
