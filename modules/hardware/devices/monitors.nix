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
			};
		});
		default = {};
		description = "Device-specific monitors";
	};
}
