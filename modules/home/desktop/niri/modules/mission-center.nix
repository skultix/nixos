{ ... }: {
	programs.niri.settings = {
		binds."Mod+Shift+Escape".action.spawn-sh = "missioncenter";

		window-rules = [{
			matches = [
				{ app-id = "io.missioncenter.MissionCenter"; }
			];

			open-fullscreen = false;
		}];
	};
}
