{ ... }: {
	wayland.windowManager.hyprland.settings = {
		input = {
			sensitivity = 0; # don't change

			follow_mouse = 2;
			float_switch_override_focus = 0;
		};

		cursor = {
			no_hardware_cursors = true;
		};
	};
}
