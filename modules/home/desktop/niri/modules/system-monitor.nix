{ config, ... }: {
	programs.niri.settings = {
		binds."Mod+Shift+Escape".action.spawn-sh = config.cfg.programs.system-monitor;

		window-rules = [{
			matches = [
				{ app-id = "io.missioncenter.MissionCenter"; }
			];

			open-fullscreen = false;
		}];
	};
}
