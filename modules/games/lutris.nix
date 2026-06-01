{ home, pkgs, lib, osConfig, ... }: let
gamecfg = osConfig.cfg.games;
in lib.mkIf gamecfg.lutris.enablehome {
	programs.lutris = {
		enable = true;
		package = lib.warn "lutris openldap temporarily overridden"
		(pkgs.lutris.override {
			# Intercept buildFHSEnv to modify target packages
			buildFHSEnv = args: pkgs.buildFHSEnv (args // {
				multiPkgs = envPkgs:
				let
				# Fetch original package list
				originalPkgs = args.multiPkgs envPkgs;

				# Disable tests for openldap
				customLdap = envPkgs.openldap.overrideAttrs (_: { doCheck = false; });
				in
				# Replace broken openldap with the custom one
				builtins.filter (p: (p.pname or "") != "openldap") originalPkgs ++ [ customLdap ];
			});
		});

		extraPackages = with pkgs; [
			winetricks
			protontricks
			gamescope
			gamemode
			umu-launcher
		];
		steamPackage = osConfig.programs.steam.package;
		# protonPackages = with pkgs; [ proton-ge-bin ];
		# defaultWinePackage = pkgs.proton-ge-bin;
	};
}
