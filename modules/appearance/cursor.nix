{ home, pkgs, ... }: let
cursor-pkg = pkgs.phinger-cursors;
in {
	# Added to system packages so sddm can render it
	environment.systemPackages = [ cursor-pkg ];
}
// home {
	home.packages = [ cursor-pkg ];

	home.pointerCursor = {
		enable = true;
		name = "phinger-cursors-dark";
		package = cursor-pkg;
		size = 24;
		gtk.enable = true;
		x11.enable = true;
	};


}
