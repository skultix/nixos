{ home, inputs, pkgs, config, lib, ... }: {
	cfg.programs = let
	ipc = action: "noctalia msg ${action}";
	peek-time = 2;
	in {
		lock = ipc "session lock";
		relock = let
		scu = "systemctl --user";
		display = "$(ls /run/user/1000 | grep noctalia-wayland | head -1 | sed -E 's/noctalia-wayland-([0-9]).[ls]ock/wayland-\1/g')";
		in "${scu} set-environment WAYLAND_DISPLAY=${display}";
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

	# the flake module only disables "programs/noctalia.nix", but home-manager has
	# since moved its own module into a directory, so disable that path as well
	disabledModules = [ "programs/noctalia" ];

	home.packages = with pkgs; [
		ddcutil
	];

	programs.noctalia = {
		enable = true;
		systemd.enable = true;
		settings = lib.mkMerge [
			(builtins.fromTOML (builtins.readFile ./noctalia.toml))
			(lib.mkIf (config.networking.hostName == "skultikpc") (builtins.fromTOML (builtins.readFile ./lockscreen-skultikpc.toml)))
		];
	};

	stylix.targets.noctalia.enable = false;
}
