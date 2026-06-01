{ home, pkgs, ... }: home {
	home.packages = with pkgs; [
		ffmpeg-full
		imagemagick
		librsvg
	];
}
