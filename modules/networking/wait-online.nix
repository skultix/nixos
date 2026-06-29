{ ... }: {
	systemd.services.NetworkManager-wait-online.enable = false;
	systemd.network.wait-online.enable = false; 
	boot.initrd.systemd.network.wait-online.enable = false;
}
