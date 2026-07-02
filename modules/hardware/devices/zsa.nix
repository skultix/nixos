{ pkgs, ... }: {
	services.udev.packages = with pkgs; [
		zsa-udev-rules
	];
}
