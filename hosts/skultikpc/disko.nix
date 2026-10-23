{ ... }: let
btrfs-mount-options = [ "relatime" "ssd" "discard=async" "space_cache=v2" "compress=zstd" ];
in {
	disko.devices = {
		disk.nvme = {
			type = "disk";
			device = "/dev/nvme0n1";
			content = {
				type = "gpt";
				partitions = {
					ESP = {
						priority = 1;
						size = "1G";
						type = "EF00";
						content = {
							type = "filesystem";
							format = "vfat";
							mountpoint = "/boot";
							mountOptions = [ "fmask=0022" "dmask=0022" ];
							extraArgs = [ "-n" "NIXBOOT" ];
						};
					};
					root = {
						priority = 2;
						end = "-16G";
						content = {
							type = "btrfs";
							extraArgs = [ "-L" "NIXROOT" ];
							subvolumes = {
								"@" = {
									mountpoint = "/";
									mountOptions = btrfs-mount-options;
								};
								"@home" = {
									mountpoint = "/home";
									mountOptions = btrfs-mount-options;
								};
								"@var" = {
									mountpoint = "/var";
									mountOptions = btrfs-mount-options;
								};
								"@tmp" = {
									mountpoint = "/tmp";
									mountOptions = btrfs-mount-options;
								};
								"@nix" = {
									mountpoint = "/nix";
									mountOptions = btrfs-mount-options;
								};
							};
						};
					};
					swap = {
						priority = 3;
						size = "100%";
						content = {
							type = "swap";
							discardPolicy = "both";
							extraArgs = [ "-L" "NIXSWAP" ];
						};
					};
				};
			};
		};

		# CT1000BX500SSD1 | 1TB
		disk.ssd1 = {
			type = "disk";
			device = "/dev/disk/by-id/ata-CT1000BX500SSD1_2522E9C1028D";
			content = {
				type = "gpt";
				partitions.main = {
					priority = 1;
					size = "100%";
					content = {
						type = "btrfs";
						extraArgs = [ "-L" "GAMES" ];
						subvolumes = {
							"@games" = {
								mountpoint = "/mnt/games";
								mountOptions = btrfs-mount-options;
							};
						};
					};
				};
			};
		};

		# CT1000MX500SSD1 | 1TB
		disk.ssd2 = {
			type = "disk";
			device = "/dev/disk/by-id/ata-CT1000MX500SSD1_2421E8B2EE53";
			content = {
				type = "gpt";
				partitions.main = {
					priority = 1;
					size = "100%";
					content = {
						type = "btrfs";
						extraArgs = [ "-L" "EXTRA" ];
						subvolumes = {
							"@extra" = {
								mountpoint = "/mnt/extra";
								mountOptions = btrfs-mount-options;
							};
						};
					};
				};
			};
		};
	};
}
