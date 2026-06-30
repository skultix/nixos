{ inputs, pkgs, ... }: {
	environment.systemPackages = [
		inputs.aspid.packages.${pkgs.stdenv.hostPlatform.system}.default
	];
}
