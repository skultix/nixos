{ pkgs, lib, config, ... }: {
	options = {
		cfg.games.epic.enable = lib.mkOption {
			default = true;
		};
	};

	config = lib.mkIf config.cfg.games.epic.enable {
		environment.systemPackages = with pkgs; [
			(heroic.override {
				extraPkgs = pkgs: [
					pkgs.gamescope
				];
			})
			umu-launcher
		];

		environment.etc."heroic/catppuccin".source = pkgs.fetchFromGitHub {
			owner = "catppuccin";
			repo = "heroic";
			rev = "1248e2d24721aa1cc54f185b1b851826207a2b46";
			hash = "sha256-JcLvp/7F+lmU8FVkrMvgtnu087XLS1T3/3X6OrA/yOg=";
		} + "/themes";

		programs.gamescope.enable = true;
	};
}
