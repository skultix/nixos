{ ... }: {
	programs.niri.settings = {
		layout = {
			gaps = 10;

			always-center-single-column = true;

			focus-ring.enable = false;

			border = {
				width = 4;
				active-gradient = {
					from = "#89b4fa";
					to = "#cba6f7";
					angle = 45;
				};

				inactive-color = "#45475a";
				urgent-color = "#f38ba8";
			};

			tab-indicator = {
				enable = true;
				hide-when-single-tab = true;
				place-within-column = true;
				gap = 5;
				gaps-between-tabs = 8;
				width = 8;
				length.total-proportion = 0.08;
				corner-radius = 8;
			};

			struts = { # extra space
				top = 4;
			};
		};
	};
}
