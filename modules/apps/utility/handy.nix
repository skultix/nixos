{ home, inputs, pkgs, ... }: {
	imports = [ inputs.handy.nixosModules.default ];

	programs.handy = {
		enable = true;
	};

	environment.systemPackages = with pkgs; [
		# Handy recommends this for wayland
		wtype
		# and this for xwayland apps
		xdotool
	];
}
// home {
	imports = [ inputs.handy.homeManagerModules.default ];

	services.handy = {
		enable = true;
	};

	programs.niri.settings.binds = {
		"Mod+Comma".action.spawn-sh = "handy --toggle-transcription";
	};
}
