{ ... }: {
	programs.niri.settings = {
		input = {
			keyboard = {
				numlock = true;
			};

			touchpad = {
				tap = false; # tap-clicking
				natural-scroll = true;
				dwt = true; # disable when typing
				scroll-factor = 0.15;
			};

			mouse = {
				natural-scroll = true;
			};
		};
	};
}
