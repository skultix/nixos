{ pkgs, ... }: {
	home.packages = with pkgs; [
		scrcpy
	];

	xdg.desktopEntries.scrcpy = {
		name = "scrcpy";
		exec = "${pkgs.scrcpy}/bin/scrcpy %U";
		comment = "Screencopy a connected Android device";
		categories = ["Utility"];
		terminal = false;
		icon = "phone";
		settings.Keywords = "android";
	};

	programs.niri.settings.window-rules = [{
		matches = [
			{ app-id = ".scrcpy-wrapped"; }
		];

		default-column-width = {};
		default-window-height.proportion = 1.;
	}];
}
