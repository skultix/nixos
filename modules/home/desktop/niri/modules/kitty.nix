{ ... }: {
	programs.niri.settings = {
		binds."Mod+Return".action.spawn = "kitty";
	};
}
