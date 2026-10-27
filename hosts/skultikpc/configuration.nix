{ inputs, config, ... }: {
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
			extraParams = [
				"amd_pstate=active"
				# MSI Optix monitor exposes a broken 22K "driver" disk (sdc) that spams I/O errors
				"usb-storage.quirks=1462:3fa4:i"
			];
		};

		hardware = {
			monitors.DP-6 = { width = 3440; height = 1440; hz = 240; hdr = true; };
			nvidia.enable = true;
			stream-deck.enable = true;
			rgb.enable = true;
			fan-control = {
				enable = true;
				kernelModules = {
					packages = [ config.boot.kernelPackages.nct6687d ];
					modules = [ "nct6687" ];
					# claims the same chip, but read-only
					blacklist = [ "nct6683" ];
				};
			};
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
				clients.lunar.enable = true;
			};
			vr = {
				enable = true;
				sidequest.enable = false;
			};
		};
	};

	powerManagement.cpuFreqGovernor = "performance";

	system.stateVersion = "26.05";
}
