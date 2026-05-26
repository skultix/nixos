{ home, inputs, pkgs, ... }: home {
	home.packages = [
		inputs.vercel-cli.packages.${pkgs.stdenv.hostPlatform.system}.default
	];
}
