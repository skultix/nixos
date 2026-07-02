{ inputs, pkgs, ... }: {
	services.paseo = {
		enable = true;
	};

	environment.systemPackages = [
		inputs.paseo.packages.${pkgs.stdenv.hostPlatform.system}.desktop
	];
 }
