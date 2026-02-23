{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		zsa-udev-rules
	];
}
