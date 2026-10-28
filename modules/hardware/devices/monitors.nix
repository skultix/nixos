{ lib, ... }: {
	options.cfg.hardware.monitors = lib.mkOption {
		type = lib.types.attrsOf (lib.types.submodule {
			options = {
				width = lib.mkOption {
					type = lib.types.int;
					description = "Monitor width (pixels)";
				};
				height = lib.mkOption {
					type = lib.types.int;
					description = "Monitor height (pixels)";
				};
				hz = lib.mkOption {
					type = lib.types.int;
					description = "Monitor refresh rate (hz)";
				};
				hdr = lib.mkEnableOption "HDR support";
				niri-suffix = lib.mkOption {
					type = lib.types.nullOr lib.types.str;
					default = null;
					description = "Monitor name suffix based on `niri msg outputs`";
				};
				hyprland-opts = lib.mkOption {
					default = {};
					description = "Extra options to pass to `hl.monitor`";
				};
			};
		});
		default = {};
		description = "Device-specific monitors";
	};
}
