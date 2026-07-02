{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		boxflat
	];

	services.udev.extraRules = ''
	SUBSYSTEM=="tty", KERNEL=="ttyACM*", ATTRS{idVendor}=="346e", ACTION=="add", MODE="0666", TAG+="uaccess"
	SUBSYSTEM=="misc", KERNEL=="uinput", OPTIONS+="static_node=uinput", TAG+="uaccess"
	'';
}
