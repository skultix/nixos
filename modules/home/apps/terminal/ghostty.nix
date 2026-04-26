{ ... }: {
	programs.ghostty = {
		enable = true;

		settings = {
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
		};
	};
}
