{ lib, ... }: {
	options.home-modules = lib.mkOption {
		default = [];
	};
}
