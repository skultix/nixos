{ config, ... }: {
	wayland.windowManager.hyprland.settings.bind = [
		", XF86PowerOff, exec, ${config.cfg.programs.power-menu}"
	];
}
