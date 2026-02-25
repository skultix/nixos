{ inputs, pkgs, ... }: {
	environment.systemPackages = [
		inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.agenix
	];

	age = {
		identityPaths = [
			"/etc/ssh/ssh_host_ed25519_key"
			"/home/themarlstar/.ssh/agenix"
		];
	};
}
