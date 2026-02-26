{ ... }: {
	programs.light = {
		enable = true;
		brightnessKeys = {
			enable = true;
			step = 10;
			minBrightness = 0;
		};
	};

	cfg.users.main.groups = [ "video" ];
}
