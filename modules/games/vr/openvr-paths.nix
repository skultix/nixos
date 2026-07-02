{ home, config, osConfig, lib, pkgs, ... }: let
gamecfg = config.cfg.games;
vrcfg = gamecfg.vr;
steam = "${config.hm.xdg.dataHome}/Steam";
in lib.mkIf vrcfg.enable (home {
	xdg.configFile."openvr/openvrpaths.vrpath".text = (builtins.toJSON {
		version = 1;
		jsonid = "vrpathreg";

		external_drivers = null;
		config = lib.optionals gamecfg.steam.enable [ "${steam}/config"];
		log = lib.optionals gamecfg.steam.enable [ "${steam}/logs" ];

		runtime = []
		# SteamVR comes first
		++ lib.optional gamecfg.steam.enable "${steam}/steamapps/common/SteamVR"
		++ lib.optional vrcfg.xrizer.enable "${pkgs.xrizer}/lib/xrizer"
		;
	});
})
