{ config, ... }: {
	services.harmonia.cache = {
		enable = true;
		signKeyPaths = [ config.age.secrets."harmonia/private-key".path ];

		settings = {
			bind = "[::]:5000";
			priority = 10; # Lower = higher priority
			# Incompatible with resuming, disable if connection is flaky
			enable_compression = true;
		};
	};

	networking.firewall.interfaces.tailscale0.allowedTCPPorts = [ 5000 ];

	nix.settings = let
	all-caches = [
		# PC
		"http://skultikpc.local:5000" # Local network
		"http://skultikpc:5000" # Tailscale MagicDNS
		# Laptop
		"http://skultik.local:5000" # Local network
		"http://skultik:5000" # Tailscale MagicDNS
	];
	non-self-caches = builtins.filter (item: builtins.match ".*${config.networking.hostName}.*" item == null) all-caches;
	in {
		trusted-substituters = non-self-caches;
		trusted-public-keys = [
			"My Machines:QTk6YdrJBlLueYowgkUaJJHJoySQ32DuyOs41oy74lc="
		];
	};

	age.secrets."harmonia/private-key" = {
		file = ../../secrets/harmonia/private-key.age;
		owner = "harmonia";
		group = "harmonia";
		mode = "0400";
	};
}
