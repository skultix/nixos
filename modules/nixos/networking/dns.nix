{ lib, config, ... }: {
	options = {
		cfg.networking.dns.nameservers = lib.mkOption {
			default = [
				"8.8.8.8" "8.8.4.4" # Google DNS
			];
		};
	};
	config = {
		networking.networkmanager.insertNameservers = config.cfg.networking.dns.nameservers;
	};
}
