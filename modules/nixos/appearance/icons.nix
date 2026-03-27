{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		gnome.adwaita-icon-theme
		gnome-icon-theme
		hicolor-icon-theme
	];
}
