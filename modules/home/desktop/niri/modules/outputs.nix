{ ... }: {
	programs.niri.settings = {
		# TODO: make monitors a system configuration.nix option
		outputs.eDP-1 = { # Laptop screen
			mode = {
				width = 1920;
				height = 1200;
			};
		};

		outputs.DP-6 = { # Monitor
			mode = {
				width = 3440;
				height = 1440;
			};
		};
	};
}
