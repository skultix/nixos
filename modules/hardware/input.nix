{ ... }: {
	services.libinput.enable = true;
	hardware.uinput.enable = true;
	users.groups.uinput = {};
}
