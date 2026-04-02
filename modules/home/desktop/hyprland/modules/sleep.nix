{ ... }: {
	wayland.windowManager.hyprland.settings = {
		bindl = [
			"$mainMod, S, exec, systemctl suspend"
			"$ctrlMod, S, exec, $lock && sleep 0.5 && systemctl suspend"
		];
	};
}
