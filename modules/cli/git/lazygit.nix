{ home, config, ... }: home {
	programs.lazygit = {
		enable = true;
		settings = {
			quitOnTopLevelReturn = true;
			gui = {
				nerdFontsVersion = "3";
			};
			git = {
				overrideGpg = config.hm.services.gpg-agent.enable;
			};
		};
	};
}
