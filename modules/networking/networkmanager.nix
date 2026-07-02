{ pkgs, ... }: {
	networking.networkmanager = {
		enable = true;
		plugins = with pkgs; [
			networkmanager-openconnect
		];
	};

	cfg.users.main.groups = [ "networkmanager" ];
}
