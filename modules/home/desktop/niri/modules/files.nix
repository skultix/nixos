{ config, ... }: {
	programs.niri.settings = {
		binds."Mod+E".action.spawn-sh = config.cfg.programs.file-manager;
		binds."Mod+Slash".action.spawn-sh = config.cfg.programs.file-search;
	};
}
