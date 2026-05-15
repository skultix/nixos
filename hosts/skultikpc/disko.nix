{ ... }: {
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
									mountOptions = [ "relatime" "ssd" "discard=async" "space_cache=v2" "compress=zstd" ];
								};
								"@home" = {
									mountpoint = "/home";
									mountOptions = [ "relatime" "ssd" "discard=async" "space_cache=v2" "compress=zstd" ];
								};
								"@var" = {
									mountpoint = "/var";
									mountOptions = [ "relatime" "ssd" "discard=async" "space_cache=v2" "compress=zstd" ];
								};
								"@tmp" = {
									mountpoint = "/tmp";
									mountOptions = [ "relatime" "ssd" "discard=async" "space_cache=v2" "compress=zstd" ];
								};
								"@nix" = {
									mountpoint = "/nix";
									mountOptions = [ "relatime" "ssd" "discard=async" "space_cache=v2" "compress=zstd" ];
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
	};
}
