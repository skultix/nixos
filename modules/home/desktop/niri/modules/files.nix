{ ... }: {
	programs.niri.settings = {
		binds."Mod+E".action.spawn-sh = "nautilus";
		binds."Mod+Slash".action.spawn-sh = "fsearch";
	};
}
