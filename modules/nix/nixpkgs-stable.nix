{ inputs, pkgs, config, ... }: {
	_module.args.stable = import inputs.stable {
		inherit (pkgs.stdenv.hostPlatform) system;
		inherit (config.nixpkgs) config;
	};
}
