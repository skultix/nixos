{ config, ... }: {
	programs.niri.settings.binds."Mod+Control+L".action.spawn-sh = config.cfg.programs.lock;
}
