{ home, config, lib, ... }: let
opts = builtins.map (i: {
	# connector names (DP-1, eDP-1, HDMI-A-1) are used as-is, anything else is matched by monitor description
	output = if builtins.match "[A-Za-z]+(-[A-Z])?-[0-9]+" i.name != null then i.name else "desc:${i.name}";
	mode = let s = builtins.toString; in "${s i.value.width}x${s i.value.height}@${s i.value.hz}";
	position = "0x0";
	scale = 1;
	# cm = lib.mkIf i.value.hdr "hdr";
	supports_hdr = i.value.hdr;
} // i.value.hyprland-opts)
(lib.attrsToList config.cfg.hardware.monitors);

monitors = builtins.map (m: { _args = [ m ]; }) opts;

in home {
	wayland.windowManager.hyprland.settings.monitor = monitors;
}
