{ config, ... }: {
	networking.networkmanager.ensureProfiles = {
		environmentFiles = [
			config.age.secrets."wifi/eduroam".path
		];

		profiles = {
			eduroam = {
				connection = {
					id = "eduroam";
					type = "wifi";
					autoconnect = "true";
					autoconnect-priority = "10";
				};

				wifi = {
					mode = "infrastructure";
					ssid = "eduroam";
				};

				wifi-security.key-mgmt = "wpa-eap";

				"802-1x" = {
					eap = "peap";
					phase2-auth = "mschapv2";
					identity = "s5026398@uq.edu.au";
					anonymous-identity = "anonymous@uq.edu.au";
					password = "$EDUROAM_PASSWORD";
					proactive-key-caching = "1";
				};

				ipv4.method = "auto";
				ipv6.method = "auto";
			};
		};
	};

	age.secrets."wifi/eduroam".file = ../../../../secrets/wifi/eduroam.age;
}
