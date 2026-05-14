{ config, ... }: {
	wayland.windowManager.hyprland.settings.bind = [
		"$mainMod, E, exec, ${config.cfg.programs.file-manager}"
	];
}
