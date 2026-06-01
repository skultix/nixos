{ home, pkgs, ... }: {
	cfg.programs.system-monitor = "missioncenter";
} // home {
	home.packages = with pkgs; [
		mission-center
	];

	dconf.settings."io/missioncenter/MissionCenter" = {
		window-selected-page = "apps-page";
		performance-sliding-graphs = true;
		performance-smooth-graphs = true;
	};

	programs.niri.settings.window-rules = [
		{ # Don't open fullscreen
			matches = [ { app-id = "io.missioncenter.MissionCenter"; } ];
			open-fullscreen = false;
		}
	];
}
