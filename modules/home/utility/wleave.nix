{ pkgs, ... }: {
	cfg.programs.power-menu = "wleave";

	programs.wleave = {
		enable = true;
		settings = {
			# -l ~/.config/wlogout/layout -C ~/.config/wleave/style.css
			# $powermenu = wleave --buttons-per-row 6 --margin-top 500 --margin-bottom 500 --layout /home/themarlstar/.config/wleave/layout --css /home/themarlstar/.config/wleave/style.css

			buttons-per-row = "1/2";
			close-on-lost-focus = true;
			margin = 200;
			button-aspect-ratio = "1/1";
			show-keybinds = true;
			no-version-info = true;
			buttons = [
				{
					label = "lock";
					action = "hyprlock";
					text = "Lock";
					keybind = "l";
					icon = "${pkgs.wleave}/share/wleave/icons/lock.svg";
				}
				{
					label = "hibernate";
					action = "systemctl hibernate";
					text = "Hibernate";
					keybind = "h";
					icon = "${pkgs.wleave}/share/wleave/icons/hibernate.svg";
				}
				{
					label = "logout";
					action = [
						{
							"$DESKTOP_SESSION" = "hyprland";
							shell = "hyprshutdown";
						}
					];
					text = "Logout";
					keybind = "e";
					icon = "${pkgs.wleave}/share/wleave/icons/logout.svg";
				}
				{
					label = "shutdown";
					action = "systemctl poweroff";
					text = "Shutdown";
					keybind = "x";
					icon = "${pkgs.wleave}/share/wleave/icons/shutdown.svg";
				}
				{
					label = "suspend";
					action = "systemctl suspend";
					text = "Suspend";
					keybind = "s";
					icon = "${pkgs.wleave}/share/wleave/icons/suspend.svg";
				}
				{
					label = "reboot";
					action = "systemctl reboot";
					text = "Reboot";
					keybind = "r";
					icon = "${pkgs.wleave}/share/wleave/icons/reboot.svg";
				}
			];
		};
	};
}
