{ home, pkgs, ... }: {
	programs.niri = {
		enable = true;
		package = pkgs.niri;
	};
}
// home {
	# niri-flake automaticlly creates a polkit daemon
	# but I want to use my own configured polkit agent
	systemd.user.services.niri-flake-polkit.enable = false;

	home.packages = with pkgs; [
		xwayland-satellite
	];
}
