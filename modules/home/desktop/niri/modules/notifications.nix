{ ... }: {
	programs.niri.settings = {
		binds = let
		ipc = action: "noctalia-shell ipc call ${action}";
		notifications = action: { spawn-sh = ipc action; };
		in {
			"Mod+N" = notifications "toggleHistory";
			"Mod+Shift+N" = notifications "clear";
		};
	};
}
