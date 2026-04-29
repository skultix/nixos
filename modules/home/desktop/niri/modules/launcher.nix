{ ... }: {
	programs.niri.settings = {
		binds."Mod+Space".action.spawn-sh = "vicinae toggle";
	};
}
