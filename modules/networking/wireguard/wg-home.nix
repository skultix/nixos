{ config, ... }: {
	networking.networkmanager.ensureProfiles = {
		environmentFiles = [
			config.age.secrets."wg/wg-home".path
		];

		profiles.wghome = {
			connection = {
				id = "Home Wireguard";
				type = "wireguard";
				interface-name = "wghome";
				autoconnect = "false";
			};
			wireguard = {
				private-key = "$WGHOME_PRIVATE_KEY";
			};
			"wireguard-peer.$WGHOME_PEER_PUBLIC_KEY" = {
				allowed-ips = "0.0.0.0/0";
				endpoint = "$WGHOME_ENDPOINT";
				persistent-keepalive = 25;
			};
			ipv4 = {
				method = "manual";
				address1 = "192.168.2.4/32";
				dns = "192.168.2.1;";
			};
		};
	};

	age.secrets."wg/wg-home".file = ../../../secrets/wg/wg-home.age;
}
