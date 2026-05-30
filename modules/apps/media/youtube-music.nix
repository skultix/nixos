{ home, pkgs, ... }: home {
	home.packages = with pkgs; [
		pear-desktop
	];

	xdg.autostart.entries = [
		"${pkgs.pear-desktop}/share/applications/${(builtins.elemAt pkgs.pear-desktop.desktopItems 0).name}"
	];
}
