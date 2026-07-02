{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		kanata
	];

	environment.etc."kanata/config.kbd".source = ./config.kbd;

	systemd.services.kanata = {
		description = "kanata";
		wantedBy = ["multi-user.target"];
		serviceConfig = {
			Type = "simple";
			ExecStart = "${pkgs.kanata}/bin/kanata -c /etc/kanata/config.kbd --nodelay";
			Restart = "on-failure";
			SupplementaryGroups = [ "input" "uinput" ];
		};
	};
}
