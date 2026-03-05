{ lib, config, ... }: {
	options = {
		cfg.networking.dns.nameservers = lib.mkOption {
			default = [
				"8.8.8.8" "8.8.4.4" # Google DNS
			];
		};
	};
	config = let
	nameservers = config.cfg.networking.dns.nameservers;
	in {
		networking = {
			nameservers = nameservers;
			dhcpcd.extraConfig = "nohook resolv.conf";
			networkmanager.dns = "systemd-resolved";
		};

		services.resolved.enable = true;
	};
}
