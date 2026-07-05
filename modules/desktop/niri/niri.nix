{ pkgs, ... }: {
	programs.niri = {
		enable = true;
		package = pkgs.niri;
	};

	# niri-flake automaticlly creates a polkit daemon
	# but I want to use my own configured polkit agent
	systemd.user.services.niri-flake-polkit.enable = false;

	# xwayland
	environment.systemPackages = with pkgs; [ xwayland-satellite ];
}
