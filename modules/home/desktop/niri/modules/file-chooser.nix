{ ... }: {
	programs.niri.settings = {
		window-rules = [{
			matches = [
				{ app-id = "org.gnome.Nautilus"; title = "Open File"; }
			];

			default-column-width.fixed = 1250;
			default-window-height.proportion = 0.7;
		}];
	};
}
