{ home, pkgs, ... }: home {
	# programs.niri.settings = {
	#
	# };
	# programs.niri.config = null; # don't generate for the minute

	home.packages = with pkgs; [
		xwayland-satellite
	];
}
