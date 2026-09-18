{ home, inputs, pkgs, config, ... }: let
identityPaths = [
	"/etc/ssh/ssh_host_ed25519_key"
	"/home/skultix/.ssh/agenix"
];
masterIdentities = [
	"/home/skultix/.ssh/agenix.pub"
];

agenix-rekey-package = inputs.agenix-rekey.packages.${pkgs.stdenv.hostPlatform.system}.default;
in {
	imports = [
		inputs.agenix.nixosModules.default
		inputs.agenix-rekey.nixosModules.default
	];

	environment.systemPackages = with pkgs; [
		rage
		agenix-rekey-package
	];

	age.identityPaths = identityPaths;

	age.rekey = {
		hostPubkey = config.identities.this.ssh-pubkey;
		masterIdentities = masterIdentities;
		storageMode = "local";
		localStorageDir = ../.. + "/secrets/rekeyed/${config.networking.hostname}";
	};
}
// home {
	imports = [
		inputs.agenix.homeManagerModules.default
	];

	age.identityPaths = identityPaths;
}
