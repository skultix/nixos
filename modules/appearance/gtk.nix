{ home, pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		kdePackages.breeze-icons
		adwaita-icon-theme
		gnome-icon-theme
		hicolor-icon-theme
	];
} // home {
	home.packages = with pkgs; [
		dconf
	];

	gtk = {
		enable = true;
		colorScheme = "dark";
		iconTheme = {
			name = "candy-icons";
			package = pkgs.candy-icons;
		};
		gtk3 = {
			extraConfig.gtk-application-prefer-dark-theme = true;
		};
	};

	dconf.settings = {
		"org/gnome/desktop/interface" = {
			color-scheme = "prefer-dark";
		};
	};
}
