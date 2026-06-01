{ home, config, ... }: home {
	programs.niri.settings = {
		switch-events = {
			# can't use spawn-sh here for some reason
			lid-close.action.spawn = [ "sh" "-c" config.cfg.programs.lock ];
		};
	};
}
