{ pkgs, ... }: {
	home.packages = with pkgs; [
		mission-center
	];

	dconf.settings."io/missioncenter/MissionCenter" = {
		window-selected-page = "apps-page";
		performance-sliding-graphs = true;
		performance-smooth-graphs = true;
	};
}
