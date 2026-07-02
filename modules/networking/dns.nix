{ lib, config, ... }: let
default-nameservers = [ "8.8.8.8" "4.4.4.4" ];
in {
	options = {
		cfg.networking.dns.nameservers = lib.mkOption {
			default = default-nameservers;
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
