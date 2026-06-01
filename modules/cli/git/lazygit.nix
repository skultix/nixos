{ home, ... }: home {
	programs.lazygit = {
		enable = true;
		settings = {
			quitOnTopLevelReturn = true;
			gui = {
				nerdFontsVersion = "3";
			};
		};
	};
}
