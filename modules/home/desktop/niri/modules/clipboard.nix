{ ... }: {
	programs.niri.settings = {
		bind."Mod+C".action.spawn-sh = "vicinae deeplink vicinae://launch/clipboard/history";
	};
}
