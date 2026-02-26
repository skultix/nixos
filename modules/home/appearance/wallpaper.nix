{ pkgs, ... }: {
	home.packages = with pkgs; [
		# backends
		hyprpaper
		mpvpaper
		swww

		# frontend
		waypaper
	];
}
