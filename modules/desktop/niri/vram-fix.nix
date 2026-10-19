{ ... }: {
	# nvidia lets compositors keep a huge pool of freed buffers around,
	# which makes niri's VRAM usage balloon until scanout allocation fails
	# https://yalter.github.io/niri/Nvidia.html
	environment.etc."nvidia/nvidia-application-profiles-rc.d/50-limit-free-buffer-pool-in-wayland-compositors.json".text = builtins.toJSON {
		rules = [{
			pattern = { feature = "procname"; matches = "niri"; };
			profile = "Limit Free Buffer Pool On Wayland Compositors";
		}];
		profiles = [{
			name = "Limit Free Buffer Pool On Wayland Compositors";
			settings = [{ key = "GLVidHeapReuseRatio"; value = 0; }];
		}];
	};
}
