{ ... }: {
	wayland.windowManager.hyprland.settings = {
		bind = [
			"$mainMod, c, exec, vicinae deeplink vicinae://launch/clipboard/history"
		];
	};
}
