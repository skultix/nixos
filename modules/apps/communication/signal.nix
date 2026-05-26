{ home, pkgs, ... }: let
flags = "--password-store=gnome-libsecret";
in home {
	home.packages = with pkgs; [
		(symlinkJoin {
			name = "signal-desktop";
			paths = [ pkgs.signal-desktop ];
			buildInputs = [ pkgs.makeWrapper ];
			postBuild = ''
			wrapProgram $out/bin/signal-desktop \
				--add-flags "${flags}"
			'';
		})
	];

	xdg.autostart.entries = [
		"${pkgs.signal-desktop}/share/applications/${(builtins.elemAt pkgs.signal-desktop.desktopItems 0).name}"
	];

	programs.niri.settings.window-rules = [{
		matches = [ { app-id = "signal"; } ];
		open-on-workspace = "communication";
	}];
}
