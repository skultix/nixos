{ pkgs, ... }: {
	cfg.programs.file-manager = "nautilus";

	home.packages = with pkgs; [
		nautilus
	];
}
