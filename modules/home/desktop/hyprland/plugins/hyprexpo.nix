{ pkgs, ... }: {
	wayland.windowManager.hyprland = {
		plugins = with pkgs.hyprlandPlugins; [
			# hyprexpo
		];

		settings = {
			# bind = [ "$mainMod, grave, hyprexpo:expo, toggle" ];
			# gestures.gesture = [ "3, up, dispatcher, hyprexpo:expo, toggle" ];
			plugin.hyprexpo = {
				columns = 3;
				workspace_method = "first 1";
			};
		};
	};
}
