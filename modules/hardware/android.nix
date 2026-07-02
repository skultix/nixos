{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		android-tools
	];

	users.users.themarlstar.extraGroups = [ "adbusers" ];
}
