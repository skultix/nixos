{ ... }: {
	services.libinput.enable = true;

	# uinput
	hardware.uinput.enable = true;
	users = {
		users.skultix.extraGroups = [ "input" "uinput" ];
		groups.uinput = {};
	};
}
