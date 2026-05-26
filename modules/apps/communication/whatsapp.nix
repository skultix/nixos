{ home, pkgs, ... }: home {
	home.packages = with pkgs; [
		whatsapp-electron
	];

	programs.niri.settings.window-rules = let
	title = "WhatsApp Electron.*";
	in [
		{ # Always open on comms workspace
			matches = [ { title = title; } ];
			open-on-workspace = "communication";
		}
		{ # Don't focus when autostarting at launch
			matches = [ { title = title; at-startup = true; } ];
			open-focused = false;
		}
	];
}
