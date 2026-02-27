{ pkgs, ... }: {
	wayland.windowManager.hyprland = {
		plugins = with pkgs.hyprlandPlugins; [
			hyprexpo
		];

		settings = {
			gestures.gesture = [ "3, up, dispatcher, hyprexpo:expo," ];
			plugin.hyprexpo = {
				columns = 3;
				workspace_method = "first 1";
			};
		};
	};
}
