{ config, ... }: {
	programs.niri.settings = {
		switch-events = {
			lid-close.action.spawn-sh = config.cfg.programs.lock;
		};
	};
}
