{ config, osConfig, lib, pkgs, ... }: let
gamecfg = osConfig.cfg.games;
vrcfg = gamecfg.vr;
steam = "${config.xdg.dataHome}/Steam";
in lib.mkIf vrcfg.enable {
	xdg.configFile."openvr/openvrpaths.vrpath".text = (builtins.toJSON {
		version = 1;
		jsonid = "vrpathreg";

		external_drivers = null;
		config = lib.optionals gamecfg.steam.enable [ "${steam}/config"];
		log = lib.optionals gamecfg.steam.enable [ "${steam}/logs" ];

		# runtime = onlyif vrcfg.xrizer.enable [
		# 	"${pkgs.xrizer}/lib/xrizer"
		# ];
		runtime = []
		# SteamVR comes first
		++ lib.optional gamecfg.steam.enable "${steam}/steamapps/common/SteamVR"
		++ lib.optional vrcfg.xrizer.enable "${pkgs.xrizer}/lib/xrizer"
		;
	});
}
