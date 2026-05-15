{ pkgs, ... }: {
	cfg.programs.password-manager = "bitwarden";

	home.packages = with pkgs; [
		bitwarden-desktop
		bitwarden-cli
		rbw
	];

	xdg.autostart.entries = [
		"${pkgs.bitwarden-desktop}/share/bitwarden.desktop"
	];

	programs.niri.settings.window-rules = [
		{ # Browser popout windows
			matches = [
				{ app-id = "vivaldi-stable"; title = "Bitwarden - Vivaldi"; }
			];

			open-floating = true;
			default-column-width.fixed = 600;
			default-window-height.proportion = 0.5;
		}
		{ # Desktop app
			matches = [
				{ app-id = "Bitwarden"; title = "Bitwarden"; }
			];

			open-floating = true;
			open-fullscreen = false;
			open-maximized = false;
			default-column-width.fixed = 1250;
			default-window-height.proportion = 0.7;
		}
	];
}
