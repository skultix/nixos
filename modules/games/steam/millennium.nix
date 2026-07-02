{ pkgs, lib, config, inputs, ... }: {
	options = {
		cfg.games.steam.enableMillennium = lib.mkOption {
			default = config.cfg.games.steam.enable;
		};
	};

	config = lib.mkIf config.cfg.games.steam.enableMillennium {
		# <== Millennium ==>
		nixpkgs.overlays = [ inputs.millennium.overlays.default ];
		programs.steam.package = pkgs.millennium-steam;
	};
}
