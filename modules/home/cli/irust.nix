{ pkgs, ... }: {
	home.packages = with pkgs; [
		irust
	];
}
