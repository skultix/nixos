{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		android-tools
	];

	users.users.skultix.extraGroups = [ "adbusers" ];
}
