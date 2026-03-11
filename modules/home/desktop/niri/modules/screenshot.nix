{ ... }: {
	programs.niri.settings = {
		screenshot-path = "~/Pictures/Screenshots/%Y-%m-%d %H-%M-%S.png";

		binds = let
		screenshot = { action.screenshot = {}; };
		in {
			Print = screenshot;
			"Mod+Shift+S" = screenshot;
		};
	};
}
