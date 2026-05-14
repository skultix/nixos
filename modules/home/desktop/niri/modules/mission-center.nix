{ ... }: {
	programs.niri.settings = {
		binds."Mod+Shift+Escape".action.spawn-sh = "missioncenter";
	};
}
