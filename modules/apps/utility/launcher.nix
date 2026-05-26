{ home, pkgs, ... }: home {
	programs.vicinae = {
		enable = true;
		systemd.enable = true;
		# Get options from `vicinae config default`
		settings = {
			escape_key_behaviour = "close_window";
			close_on_focus_loss = true;
			pop_to_root_on_close = true;

			# theme is managed by stylix

			launcher_window = {
				blur = { enabled = true; };
			};

			favorites = [
				"applications:vivaldi-stable"
				"applications:discord"
				"core:refresh-apps"
			];
		};
	};

	cfg.programs = {
		launcher = "vicinae toggle";
		clipboard-manager = "vicinae deeplink vicinae://launch/clipboard/history";
	};

	home.packages = [
		# Use vicinae as dmenu
		(pkgs.writeShellScriptBin "dmenu" ''
		exec vicinae dmenu "$@"
		'')
	];
}
