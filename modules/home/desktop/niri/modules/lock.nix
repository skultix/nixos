{ ... }: {
	programs.niri.settings = let
	lock-cmd = "noctalia-shell ipc call lockScreen lock";
	in {
		binds."Mod+Control+L".action.spawn-sh = lock-cmd;
	};
}
