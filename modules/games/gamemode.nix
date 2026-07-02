{ pkgs, lib, config, ... }: {
	config = lib.mkIf config.cfg.games.enable {
		programs.gamemode = {
			enable = true;
			settings = {
				custom = {
					start = "${pkgs.libnotify}/bin/notify-send 'GameMode started' -a GameMode";
					end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended' -a GameMode";
				};
			};
		};

		environment.systemPackages = with pkgs; [
			libnotify
		];
	};
}
