{ config, ... }: {
	services.logind.settings = {
		Login = {
			powerKey = "ignore";
		};
	};

	programs.niri.settings = let
	powermenu = config.cfg.programs.power-menu;
	in {
		binds.XF86PowerOff.action.spawn-sh = "${powermenu}";
		input.disable-power-key-handling = true;
	};
}
