{ pkgs, ... }: {
	home.packages = with pkgs; [
		vivaldi
		vivaldi-ffmpeg-codecs
	];

	xdg = {
		autostart.entries = [
			"${pkgs.vivaldi}/share/applications/vivaldi-stable.desktop"
		];

		mimeApps.defaultApplications = let
		browser = "${pkgs.vivaldi}/share/vivaldi-stable.desktop";
		in {
			"text/html" = browser;
			"x-scheme-handler/http" = browser;
			"x-scheme-handler/https" = browser;
			"x-scheme-handler/about" = browser;
			"x-scheme-handler/unknown" = browser;
		};
	};
}
