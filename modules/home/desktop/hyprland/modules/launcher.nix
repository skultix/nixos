{ config, ... }: {
	wayland.windowManager.hyprland.settings.bind = [
		"$mainMod, space, exec, ${config.cfg.programs.launcher}"
		"$shiftMod, space, exec, ${config.cfg.programs.launcher}"
	];
}
