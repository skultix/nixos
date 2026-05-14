{ inputs, pkgs, ... }: {
	cfg.programs.lock = "noctalia-shell ipc call lockScreen lock";

	imports = [
		inputs.noctalia.homeModules.default
	];

	programs.noctalia-shell = {
		enable = true;
		settings = builtins.fromJSON (builtins.readFile ./settings.json);
		plugins = {
			sources = [
				{
					name = "Official Noctalia Plugins";
					url = "https://github.com/noctalia-dev/noctalia-plugins";
					enabled = true;
				}
			];

			states = {
				network-manager-vpn = {
					enabled = true;
					sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
				};
			};
		};
	};

	systemd.user.services.noctalia = {
		Unit = {
			Description = "noctalia shell";
		};
		Install.WantedBy = ["graphical-session.target"];
		Service = {
			Type = "simple";
			ExecStart = "${inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default}/bin/noctalia-shell";
			Restart = "on-failure";
			After = "graphical-session.target";
		};
	};
}
