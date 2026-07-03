{ config, ... }: {
	programs.eh.enable = true;

	programs.nh = {
		enable = true;
		clean = {
			enable = true;
			extraArgs = "--keep-since 4d --keep 3";
		};
		flake = "/home/skultix/nixos#${config.networking.hostName}"; # sets $NH_FLAKE variable for you
	};
}
