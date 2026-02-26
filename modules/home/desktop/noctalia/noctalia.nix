{ inputs, lib, config, ... }: {
	options = {
		cfg.desktop.statusbar.enable = lib.mkEnableOption "enable status bar";
	};

	config = lib.mkIf config.cfg.desktop.statusbar.enable {
		imports = [
			inputs.noctalia.homeModules.default
		];

		programs.noctalia-shell = {
			enable = true;
			settings = builtins.fromJSON (builtins.readFile ./settings.json);
		};

		stylix.targets.noctalia-shell.enable = false;
	};
}
