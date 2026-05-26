{ home, pkgs, ... }: home {
	home.packages = with pkgs; [
		# backends
		hyprpaper
		mpvpaper
		awww

		# frontend
		waypaper
	];
}
