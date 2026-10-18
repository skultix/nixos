{ home, config, lib, ... }: let
opts = builtins.map (i: {
	output = i.name;
	mode = let s = builtins.toString; in "${s i.value.width}x${s i.value.height}@${s i.value.hz}";
	position = "0x0";
	scale = 1;
	cm = lib.mkIf i.value.hdr "hdr";
	supports_hdr = i.value.hdr;
}) (lib.attrsToList config.cfg.hardware.monitors);

monitors = builtins.map (m: { _args = [ m ]; }) opts;

in home {
	wayland.windowManager.hyprland.settings.monitor = monitors;
}
