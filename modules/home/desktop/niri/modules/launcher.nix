{ config, ... }: {
	programs.niri.settings = {
		binds."Mod+Space".action.spawn-sh = config.cfg.programs.launcher;
	};
}
