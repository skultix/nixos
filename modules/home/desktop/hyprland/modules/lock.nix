{ ... }: {
	wayland.windowManager.hyprland.settings = {
		# "$lock" = "hyprlock";
		"$lock" = "noctalia-shell ipc call lockScreen lock";

		bind = [
			"$ctrlMod, L, exec, $lock"
		];
	};
}
