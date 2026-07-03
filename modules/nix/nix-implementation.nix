{ inputs, ... }: let
detsys-no-telemetry = { DETSYS_IDS_TELEMETRY = "disabled"; };
in {
	imports = [
		inputs.determinate.nixosModules.default
	];

	environment.variables = detsys-no-telemetry;
	systemd.services.determinate-nixd.environment = detsys-no-telemetry;

	environment.etc."determinate/config.json".text = builtins.toJSON {
		telemetry.sentry.endpoint = null;
	};
}
