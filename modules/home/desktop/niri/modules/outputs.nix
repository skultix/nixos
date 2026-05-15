{ osConfig, lib, ... }: let
monitor-map = lib.mapAttrs' (monitor: cfg: lib.nameValuePair monitor { mode.width = 1920; mode.height = 1080; });
in {
	programs.niri.settings.outputs = monitor-map osConfig.cfg.hardware.monitors;
}
