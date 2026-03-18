{ pkgs, ... }: {
	services.udev.packages = with pkgs; [
		steam-devices-udev-rules
	];
}
