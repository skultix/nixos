{ ... }: {
	programs.niri.settings = {
		binds."Mod+C".action.spawn-sh = "vicinae deeplink vicinae://launch/clipboard/history";
	};
}
