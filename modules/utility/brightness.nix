{ home, pkgs, ... }: home {
	home.packages = with pkgs; [
		brightnessctl
	];

	programs.niri.settings.binds = let
	brightness-bind = cmd: {
		action.spawn-sh = cmd;
		allow-when-locked = true;
	};
	in {
		XF86MonBrightnessUp = brightness-bind "brightnessctl s +10%";
		XF86MonBrightnessDown = brightness-bind "brightnessctl s -10%";
	};
}
