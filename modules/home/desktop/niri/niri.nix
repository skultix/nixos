{ inputs, pkgs, ... }: {
	imports = [
		inputs.niri.homeModules.niri
	];

	programs.niri = {
		enable = true;
		package = pkgs.niri;
		config = null; # don't generate for now
	};

	home.packages = with pkgs; [
		xwayland-satellite
	];
}
