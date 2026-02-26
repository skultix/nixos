{ ... }: {
	programs.hyprlock = {
		enable = true;
		settings = {
			general = {
				hide_cursor = true;
				fail_timeout = 250; # milliseconds
				ignore_empty_input = true;
			};

			auth = {
				"fingerprint:enabled" = true;
				"fingerprint:ready_message" = "Scan fingerprint";
				"fingerprint:present_message" = "Checking fingerprint";
			};
			
			# ================ #
			# |  APPEARANCE  | #
			# ================ #
			background = [{
				monitor = "";
				path = "/home/themarlstar/wallpapers/sunset_lake.png";
				blur_passes = 2;
				contrast = 1;
			}];

			input-field = [{
				monitor = "";
				size = "600, 40";
				outline_thickness = 2;
				dots_size = 0.4;
				dots_spacing = 0.15;
				dots_center = false;
				outer_color = "rgba(0, 0, 0, 0)";
				inner_color = "rgba(0, 0, 0, 0)";
				# outer_color = "rgb(cba6f7)";
				# inner_color = "rgb(1e1e2e)";
				font_color = "rgb(cdd6f4)";
				fade_on_empty = false;
				rounding = -1;
				check_color = "rgb(204, 136, 34)";
				# placeholder_text = "<i><span foreground="##cdd6f4">Input Password...</span></i>";
				placeholder_text = "";
				hide_input = false;
				position = "10, 10";
				halign = "left";
				valign = "bottom";
			}];

			# Time
			label = [{
				monitor = "";
				text = "cmd[update:1000] echo \"$(date +'%-I:%M')\"";
				color = "rgba(242, 243, 244, 0.75)";
				font_size = 95;
				font_family = "JetBrains Mono Extrabold";
				position = "0, 50";
				halign = "center";
				valign = "center";
			}];
		};
	};

	stylix.targets.hyprlock.enable = false;
}
