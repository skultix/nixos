{ osConfig, lib, ... }: {
	# home.packages = with pkgs.python314Packages; [
	# 	pkgs.python314
	#
	# 	numpy
	# 	tkinter
	# ];

	programs.uv.enable = true;
	programs.ty.enable = true;

	programs.fish.shellAbbrs.urm = "uv run main.py";

	home.sessionPath = lib.mkIf (!osConfig.environment.localBinInPath) ["$HOME/.local/bin"];
}
