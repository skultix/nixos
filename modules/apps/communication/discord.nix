{ home, inputs, pkgs, ... }: home {
	imports = [ inputs.nixcord.homeModules.nixcord ];
	programs.discord.enable = true;
	programs.discord.settings.SKIP_HOST_UPATE = true;
	# programs.nixcord = {
	# 	enable = true;
	#
	# 	discord = {
	# 		# equicord.enable = true;
	# 		openASAR.enable = false;
	# 		krisp.enable = false;
	# 		commandLineArgs = [
	# 			# "--enable-features=VaapiVideoDecoder,MiddleClickAutoscroll"
	# 		];
	# 		settings = {
	# 			SKIP_HOST_UPDATE = true;
	# 		};
	# 	};
	#
	# 	config = let
	# 	system24 = "https://raw.githubusercontent.com/refact0r/system24/refs/heads/main/theme/system24.theme.css";
	# 	in {
	# 		enabledThemeLinks = [ system24 ];
	#
	# 		frameless = true;
	# 	};
	# };

	xdg.autostart.entries = [
		"${pkgs.discord}/share/applications/discord.desktop"
	];

	programs.niri.settings.window-rules = [
		{ # Always open on comms workspace & maximised
			matches = [ { app-id = "discord"; } ];
			open-on-workspace = "communication";
			open-maximized = true;
		}
		{ # Don't focus when autostarting at launch
			matches = [ { app-id = "discord"; at-startup = true; } ];
			open-focused = false;
		}
	];
}
