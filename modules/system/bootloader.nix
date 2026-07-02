{ ... }: {
	boot.loader = {
		systemd-boot.enable = true;
		efi.canTouchEfiVariables = true;
		timeout = 0; # auto-boots latest unless space is held
	};
}
