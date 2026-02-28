{ pkgs, ... }: {
	programs.discord = {
		enable = true;
		settings = {
			SKIP_HOST_UPDATE = true;
			DANGEROUS_ENABLE_DEVTOOLS_ONLY_ENABLE_IF_YOU_KNOW_WHAT_YOURE_DOING = true;
		};
		package = (pkgs.discord.override {
			withEquicord = true;
			# withOpenASAR = true;
			disableUpdates = false; # home-manager does this
		});
	};

	xdg.autostart.entries = [
		"${pkgs.discord}/share/applications/discord.desktop"
	];
}
