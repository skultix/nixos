{ home, inputs, pkgs, ... }: home {
	home.packages = [
		inputs.sung.packages.${pkgs.stdenv.hostPlatform.system}.default
	];
}
