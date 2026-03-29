{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		kdePackages.breeze-icons
		adwaita-icon-theme
		gnome-icon-theme
		hicolor-icon-theme
	];
}
