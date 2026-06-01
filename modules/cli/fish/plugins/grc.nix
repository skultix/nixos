{ home, pkgs, ... }: home {
	programs.fish.plugins = [
		{ name = "grc"; src = pkgs.fishPlugins.grc.src; }
	];

	home.packages = with pkgs; [
		grc
	];
}
