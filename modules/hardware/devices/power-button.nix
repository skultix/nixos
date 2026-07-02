{ home, config, ... }: {
	services.logind.settings = {
		Login = {
			powerKey = "ignore";
		};
	};
}
// home {
	programs.niri.settings = let
	powermenu = config.cfg.programs.power-menu;
	in {
		binds.XF86PowerOff.action.spawn-sh = "${powermenu}";
		input.power-key-handling.enable = false;
	};
}
