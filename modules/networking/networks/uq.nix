{ config, ... }: {
	networking.networkmanager.ensureProfiles = {
		environmentFiles = [
			config.age.secrets."wifi/uq".path
		];

		profiles = {
			uq = {
				connection = {
					id = "UQ";
					type = "wifi";
					autoconnect = "true";
					autoconnect-priority = "11";
				};

				wifi = {
					mode = "infrastructure";
					ssid = "UQ";
				};

				wifi-security.key-mgmt = "wpa-eap";

				"802-1x" = {
					eap = "peap";
					phase2-auth = "mschapv2";
					identity = "s5026398";
					anonymous-identity = "anonymous";
					password = "$UQ_PASSWORD";
					proactive-key-caching = "1";
				};

				ipv4.method = "auto";
				ipv6.method = "auto";
			};
		};
	};

	age.secrets."wifi/uq".file = ../../../secrets/wifi/uq.age;
}
