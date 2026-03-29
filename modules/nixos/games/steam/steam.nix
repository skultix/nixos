{ pkgs, lib, config, ... }: {
	options = {
		cfg.games.steam.enable = lib.mkOption {
			default = true;
		};
	};

	config = lib.mkIf (config.cfg.games.enable && config.cfg.games.steam.enable) {
		programs.steam = {
			enable = true;
			remotePlay.openFirewall = true;
			localNetworkGameTransfers.openFirewall = true;

			gamescopeSession.enable = true;

			extraPackages = with pkgs; [
				jdk # java dep
			];

			extraCompatPackages = with pkgs; [
				proton-ge-bin
			];
		};

		# For appimage-formatted native linux builds of games
		programs.appimage.binfmt = true;

		programs.java.enable = true; # java dep

		environment.systemPackages = with pkgs; [
			protonup-rs
		];
	};
}
