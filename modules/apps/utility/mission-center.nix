{ home, pkgs, ... }: {
	cfg.programs.system-monitor = "missioncenter";

	programs.dconf.profiles.user.databases = [{
		settings."io/missioncenter/MissionCenter" = {
			window-selected-page = "apps-page";
			performance-sliding-graphs = true;
			performance-smooth-graphs = true;
		};
		locks = [
			"/io/missioncenter/MissionCenter/window-selected-page"
		];
	}];
} // home {
	home.packages = with pkgs; [
		mission-center
	];

	programs.niri.settings.window-rules = [
		{ # Don't open fullscreen
			matches = [ { app-id = "io.missioncenter.MissionCenter"; } ];
			open-fullscreen = false;
		}
	];
}
