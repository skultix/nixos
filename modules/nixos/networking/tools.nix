{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		dnslookup
	];
}
