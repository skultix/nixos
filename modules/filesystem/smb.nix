{ pkgs, ... }: {
	# Allows discovery of smb shares
	services.gvfs.enable = true;

	environment.systemPackages = with pkgs; [
		cifs-utils # needed to mount the shares
	];
}
