{ ... }: {
	programs.niri.settings = {
		binds = let
		locked-spawn-sh = action: {
			allow-when-locked = true;
			action.spawn-sh = action;
		};
		in {
			# Win+PageUp
			"Mod+Prior" = locked-spawn-sh "playerctl next";
			# Win+PageDown
			"Mod+Next" = locked-spawn-sh "playerctl previous";
			"Pause" = locked-spawn-sh "playerctl play-pause";
		};
	};
}
