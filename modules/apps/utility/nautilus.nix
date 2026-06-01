{ home, pkgs, ... }: {
	cfg.programs.file-manager = "nautilus";
} // home {
	home.packages = with pkgs; [
		nautilus
	];

	programs.niri.settings.window-rules = [
		{ # Open file dialog floating
			matches = [
				{ app-id = "org.gnome.Nautilus"; title = "Open File"; }
			];

			default-column-width.fixed = 1250;
			default-window-height.proportion = 0.7;
		}
	];
}
