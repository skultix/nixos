{ home, inputs, pkgs, ... }: {
	cfg.programs = let
	ipc = action: "noctalia msg ${action}";
	peek-time = 2;
	in {
		lock = ipc "session lock";
		notifications = {
			toggle = ipc "panel-toggle control-center notifications";
			clear = ipc "notification-clear-history";
		};
		bar = {
			show = ipc "bar-show";
			hide = ipc "bar-hide";
			peek = "${ipc "bar-show"} && sleep ${builtins.toString peek-time} && ${ipc "bar-hide"}";
		};
		power-menu = ipc "open session";
	};
} // home {
	imports = [
		inputs.noctalia.homeModules.default
	];

	home.packages = with pkgs; [
		ddcutil
	];

	programs.noctalia = {
		enable = true;
		systemd.enable = true;
		settings = builtins.fromTOML (builtins.readFile ./noctalia.toml);
	};
}
