{ inputs, ... }: {
	imports = [
		./hardware-configuration.nix
		inputs.disko.nixosModules.default
		./disko.nix
	];

	# <== Already modularised ==>
	cfg = {
		kernel = {
			processorOpt = "zen4";
			hzTicks = 1000;
			extraParams = ["amd_pstate=active"];
		};

		hardware = {
			monitors.DP-6 = { width = 3440; height = 1440; };
			nvidia.enable = true;
		};

		filesystems = {
			home-nas.enable = true;
		};

		games = {
			enable = true;
			steam.enable = true;
			epic.enable = true;
			minecraft = {
				enable = true;
				clients.lunar = true;
			};
			vr = {
				enable = true;
				sidequest.enable = true;
			};
		};
	};

	powerManagement.cpuFreqGovernor = "performance";

	# DO NOT CHANGE THIS, LIKE, EVER!!!
	system.stateVersion = "25.11";
}
