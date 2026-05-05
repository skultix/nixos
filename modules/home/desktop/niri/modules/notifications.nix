{ ... }: {
	programs.niri.settings = {
		binds = let
		ipc = action: "noctalia-shell ipc call ${action}";
		notifications = action: { spawn-sh = ipc "notifications ${action}"; };
		in {
			"Mod+N".action = notifications "toggleHistory";
			"Mod+Shift+N".action = notifications "clear";
		};
	};
}
