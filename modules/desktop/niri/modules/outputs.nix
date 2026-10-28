{ home, config, lib, ... }: let
monitor-map = lib.mapAttrs' (monitor: cfg: lib.nameValuePair (if cfg.niri-suffix == null then monitor else "${monitor} ${cfg.niri-suffix}") { mode.width = cfg.width; mode.height = cfg.height; });
in home {
	programs.niri.settings.outputs = monitor-map config.cfg.hardware.monitors;
}
