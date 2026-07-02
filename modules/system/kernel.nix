{ inputs, pkgs, lib, config, ... }: {
	options = {
		cfg.kernel = {
			bore = lib.mkOption {
				default = true;
				type = lib.types.bool;
			};

			processorOpt = lib.mkOption {
				default = "x86_64-v3";
				type = lib.types.str;
			};

			hzTicks = lib.mkOption {
				default = 500;
				type = lib.types.int;
			};

			usePerformanceGovernor = lib.mkEnableOption "cpu performance governor";

			extraParams = lib.mkOption {
				default = [];
				type = lib.types.listOf lib.types.str;
			};
		};
	};

	config = let
	kernelcfg = config.cfg.kernel;
	kernel-pkg = "linux-cachyos-${if kernelcfg.bore then "bore" else "latest"}";
	kernel-overrides = {
		processorOpt = kernelcfg.processorOpt;
		bbr3 = true; # better TCP congestion control algorithm
		hzTicks = toString kernelcfg.hzTicks;
		hugepage = "madvise";
		performanceGovernor = kernelcfg.usePerformanceGovernor;
	};
	kernel = pkgs.cachyosKernels.${kernel-pkg}.override kernel-overrides;
	in {
		boot.kernelPackages = pkgs.linuxKernel.packagesFor kernel;
		# boot.kernelPackages = pkgs.linuxPackages_zen;
		boot.kernelModules = [ "uinput" ];
		boot.kernelParams = [
			# speed up waking from sleep by not doing a full s3 deep sleep
			# "mem_sleep_default=s2idle"
		] ++ kernelcfg.extraParams;

		# CachyOS Kernel
		nixpkgs.overlays = [ inputs.cachyos-kernel.overlays.pinned ];
		nix.settings = {
			substituters = [ "https://attic.xuyh0120.win/lantian" ];
			trusted-public-keys = [ "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=" ];
		};
	};
}
