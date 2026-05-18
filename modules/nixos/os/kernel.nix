{ pkgs, ... }: {
	boot.kernelPackages = pkgs.linuxPackages_zen;
	boot.kernelModules = [ "uinput" ];
	boot.kernelParams = [
		# speed up waking from sleep by not doing a full s3 deep sleep
		"mem_sleep_default=s2idle"
	];
}
