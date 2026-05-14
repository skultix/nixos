{ config, ... }: {
	wayland.windowManager.hyprland.settings.bind = [
		"$mainMod, Escape, exec, ${config.cfg.programs.power-menu}"
	];
}
