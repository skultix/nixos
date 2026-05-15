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

	programs.niri.settings.window-rules = [
		{ # Always open on comms workspace
			matches = [ { app-id = "discord"; } ];
			open-on-workspace = "communication";
		}
		{ # Don't focus when autostarting at launch
			matches = [ { app-id = "discord"; at-startup = true; } ];
			open-focused = false;
		}
	];
}
