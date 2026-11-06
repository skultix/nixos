{ home, pkgs, ... }: (home {
	home.packages = with pkgs; [
		todoist-electron
	];
})
// {
	systemd.user.services.todoist = {
		enable = true;
		wantedBy = ["graphical-session.target"];
		description = "Todoist";
		serviceConfig = {
			Type = "simple";
			ExecStart = "${pkgs.todoist-electron}/bin/todoist-electron --hidden";
		};
	};
}
