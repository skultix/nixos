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
		defaults = portals {
			# By far the best imo
			FileChooser = "gnome";
		};
		in {
			common = defaults // {
				default = "gnome";
			};

			hyprland = defaults // {
				default = [ "hyprland" "gtk" ];
			};
		};
	};

	home.sessionVariables = {
		GTK_USE_PORTAL = 1;
	};
}
