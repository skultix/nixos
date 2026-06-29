{ ... }: {
	services.tailscale = {
		enable = true;
		openFirewall = true;
	};

	# Force tailscale to use nftables
	systemd.services.tailscaled.serviceConfig.Environment = [
		"TS_DEBUG_FIREWALL_MODE=nftables"
	];
}
