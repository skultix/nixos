{ config, ... }: {
	networking.networkmanager.ensureProfiles = {
		environmentFiles = [
			config.age.secrets."wg/protonvpn-brisbane".path
		];

		profiles.wg-protonvpn-bne = {
			connection = {
				id = "ProtonVPN Brisbane";
				type = "wireguard";
				interface-name = "protonvpn-bne";
				autoconnect = "false";
			};
			wireguard = {
				private-key = "$PROTONVPN_BRISBANE_PRIVATE_KEY";
			};
			"wireguard-peer.$PROTONVPN_BRISBANE_PEER_PUBLICKEY" = {
				allowed-ips = "0.0.0.0/0,::/0";
				endpoint = "$PROTONVPN_BRISBANE_ENDPOINT";
				persistent-keepalive = 25;
			};
			ipv4 = {
				method = "manual";
				address1 = "10.2.0.2/32";
				dns = "10.2.0.1;";
			};
		};
	};

	age.secrets."wg/protonvpn-brisbane".file = ../../../../secrets/wg/protonvpn-brisbane.age;
}
