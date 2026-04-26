{ ... }: {
	wayland.windowManager.hyprland.settings = {
		# TODO: make terminal a propogated hm option
		"$terminal" = "ghostty";

		bind = [
			"$mainMod, return, exec, $terminal"
		];
	};
}
