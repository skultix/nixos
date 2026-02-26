{ pkgs, ... }: {
	home.packages = with pkgs.python314Packages; [
		pkgs.python314

		numpy
	];

	programs.uv.enable = true;
	programs.ty.enable = true;

	programs.fish.shellAbbrs.urm = "uv run main.py";
}
