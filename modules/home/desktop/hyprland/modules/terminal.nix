{ config, ... }: {
	wayland.windowManager.hyprland.settings.bind = [
		"$mainMod, return, exec, ${config.cfg.programs.terminal}"
	];
}
