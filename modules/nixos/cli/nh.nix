{ config, ... }: {
	programs.nh = {
		enable = true;
		clean = {
			enable = true;
			extraArgs = "--keep-since 4d --keep 3";
		};
		flake = "/home/themarlstar/nixos#${config.networking.hostName}"; # sets NH_OS_FLAKE variable for you
	};
}
