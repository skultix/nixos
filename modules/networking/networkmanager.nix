{ pkgs, ... }: {
	networking.networkmanager = {
		enable = true;
		plugins = with pkgs; [
			networkmanager-openconnect
		];
	};

	users.users.skultix.extraGroups = [ "networkmanager" ];
}
