{ config, ... }: {
	wayland.windowManager.hyprland.settings.bind = [
		"$ctrlMod, L, exec, ${config.cfg.programs.lock}"
	];
}
