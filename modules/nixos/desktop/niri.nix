{ pkgs, ... }: {
	programs.niri = {
		enable = true;
		package = pkgs.niri;
	};

	# niri-flake automaticlly creates a polkit daemon
	# but I want to use polkit gnome as per home/security/polkit-agent.nix
	systemd.user.services.niri-flake-polkit.enable = false;
}
