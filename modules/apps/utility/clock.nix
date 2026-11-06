{ home, pkgs, ... }: home {
	home.packages = with pkgs; [
		gnome-clocks # gui
	];

	# tui
	programs.clock-rs = {
		enable = true;
		settings = {
			general = {
				color = "white";
			};

			date = {
				use_12h = false;
				utc = false;
				hide_seconds = true;
			};
		};
	};
}
