{ pkgs, ... }: {
	home.packages = with pkgs; [
		vivaldi
		vivaldi-ffmpeg-codecs
	];

	xdg.autostart.entries = [
		"${pkgs.vivaldi}/share/applications/vivaldi-stable.desktop"
	];
}
