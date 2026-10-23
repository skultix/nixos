{ lib, config, ... }: {
	options = {
		cfg.hardware.nvidia = {
			enable = lib.mkEnableOption "enable NVIDIA GPU drivers";
		};
	};

	config = lib.mkIf config.cfg.hardware.nvidia.enable {
		hardware.nvidia = {
			modesetting.enable = true;
			powerManagement.enable = true;
			open = true;
			nvidiaSettings = true;
			package = config.boot.kernelPackages.nvidiaPackages.stable;
		};

		services.xserver.videoDrivers = ["nvidia"];

		# nvidia lets compositors keep a huge pool of freed buffers around,
		# which makes VRAM usage balloon until scanout allocation fails
		# https://yalter.github.io/niri/Nvidia.html
		environment.etc."nvidia/nvidia-application-profiles-rc.d/50-limit-free-buffer-pool-in-wayland-compositors.json".text = builtins.toJSON {
			rules = lib.map (c: {
				pattern = { feature = "procname"; matches = c;};
				profile = "Limit Free Buffer Pool On Wayland Compositors";
			}) ["niri" "Hyprland"];
		};
	};
}
