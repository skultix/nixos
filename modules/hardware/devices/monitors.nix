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
			};
		});
		default = {};
		description = "Device-specific monitors";
	};
}
