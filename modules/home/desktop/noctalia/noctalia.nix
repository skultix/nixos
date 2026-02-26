{ inputs, pkgs, ... }: {
	imports = [
		inputs.noctalia.homeModules.default
	];

	programs.noctalia-shell = {
		enable = true;
		settings = builtins.fromJSON (builtins.readFile ./settings.json);
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
