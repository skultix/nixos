{ home, osConfig, lib, ... }: let
monitor-map = lib.mapAttrs' (monitor: cfg: lib.nameValuePair monitor { mode.width = cfg.width; mode.height = cfg.height; });
inhome {
	programs.niri.settings.outputs = monitor-map osConfig.cfg.hardware.monitors;
}
