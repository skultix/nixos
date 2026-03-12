{ ... }: {
	services.udev.extraRules = ''
	SUBSYSTEM=="usb", ATTRS{idVendor}=="3662", MODE="0666", TAG+="uaccess"
	SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3662", MODE="0666", TAG+="uaccess"
	KERNEL=="hidraw*", ATTRS{idVendor}=="3662", MODE="0666", TAG+="uaccess"
	'';
}
