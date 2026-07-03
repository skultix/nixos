{ ... }: {
	imports = [ ./hardware-configuration.nix ];

	# <== Already modularised ==>
	cfg = {
		hardware = {
			monitors.eDP-1 = { width = 1920; height = 1200; };
			intel-graphics.enable = true;
		};

		filesystems = {
			home-nas.enable = true;
		};

		bluetooth.enable = true;

		games = {
			enable = true;
			steam.enable = true;
			epic.enable = true;
			minecraft = {
				enable = true;
				clients.lunar = true;
			};
		};
	};

	system.stateVersion = "26.05";
}
