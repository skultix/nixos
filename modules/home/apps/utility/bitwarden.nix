{ pkgs, ... }: {
	home.packages = with pkgs; [
		bitwarden-desktop
		bitwarden-cli
		rbw
	];

	xdg.autostart.entries = [
		"${pkgs.bitwarden-desktop}/share/bitwarden.desktop"
	];
}
