{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		android-tools
	];

	cfg.users.main.groups = [ "adbusers" ];
}
