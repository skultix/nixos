{ config, ... }: {
	programs.niri.settings = {
		binds."Mod+Return".action.spawn = config.cfg.programs.terminal;
	};
}
