{ ... }: {
	wayland.windowManager.hyprland.settings.bind = [
		"$mainMod, B, exec, kitty --class bluetui bluetui"
	];
}
