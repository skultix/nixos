{ home, ... }: {
	cfg.programs.terminal = "ghostty +new-window";
} // home {
	programs.ghostty = {
		enable = true;

		settings = {
			working-directory = "home";
			window-inherit-working-directory = false;
			tab-inherit-working-directory = true;
			split-inherit-working-directory = true;

			clipboard-read = "ask";
			clipboard-write = "ask";

			shell-integration-features = [
				"cursor"
				"sudo"
				"title"
				"ssh-env"
				"ssh-terminfo"
			];

			window-padding-x = 6;

			quick-terminal-position = "center";
			quick-terminal-size = "500px,500px";

			quit-after-last-window-closed = false;
		};
	};
}
