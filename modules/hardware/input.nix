{ ... }: {
	services.libinput.enable = true;

	# uinput
	hardware.uinput.enable = true;
	users = {
		users.users.themarlstar.extraGroups = [ "input" "uinput" ];
		groups.uinput = {};
	};
}
