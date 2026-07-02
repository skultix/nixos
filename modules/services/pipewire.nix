{ ... }: {
	security.rtkit.enable = true; # recommended by the NixOS wiki
	services.pipewire = {
		enable = true;
		pulse.enable = true;
		alsa = {
			enable = true;
			support32Bit = true;
		};
	};
}
