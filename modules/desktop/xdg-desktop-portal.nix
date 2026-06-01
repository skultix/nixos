{ home, pkgs, lib, ... }: home {
	xdg.portal = {
		enable = true;
		xdgOpenUsePortal = true;
		extraPortals = with pkgs; [
			xdg-desktop-portal-gtk
			xdg-desktop-portal-gnome
		];
		config = let
		portals = attrs: lib.mapAttrs' (key: val: lib.nameValuePair "org.freedesktop.impl.portal.${key}" val) attrs;
		in {
			common = {
				default = "gnome";
			} // portals {
				# By far the best imo
				FileChooser = "gnome";
			};
		};
	};

	home.sessionVariables = {
		GTK_USE_PORTAL = 1;
	};
}
