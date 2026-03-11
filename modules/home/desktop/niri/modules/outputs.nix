{ ... }: {
	programs.niri.settings = {
		# TODO: make monitors a system configuration.nix option
		outputs.eDP-1 = { # Laptop screen
			mode = "1920x1200";
		};

		outputs.DP-6 = { # Monitor
			mode = "3440x1440";
		};
	};
}
