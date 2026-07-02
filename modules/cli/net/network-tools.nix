{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		dig
		dnslookup
		wget
	];
}
