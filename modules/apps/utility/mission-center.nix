{ home, pkgs, ... }: {
	cfg.programs.system-monitor = "missioncenter";

	programs.dconf.profiles.user.databases = [{
		settings."io/missioncenter/MissionCenter" = {
			window-selected-page = "apps-page";
			performance-sliding-graphs = true;
			performance-smooth-graphs = true;
			apps-page-merged-process-stats = true; # idk why this isn't the default lol
		};
		lockAll = true;
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
