{ home, inputs, pkgs, ... }: let
identityPaths = [
	"/etc/ssh/ssh_host_ed25519_key"
	"/home/skultix/.ssh/agenix"
];
in {
	environment.systemPackages = [
		inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.agenix
	];

	age.identityPaths = identityPaths;
}
// home {
	imports = [
		inputs.agenix.homeManagerModules.default
	];

	age.identityPaths = identityPaths;
}
