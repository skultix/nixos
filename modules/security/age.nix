{ home, inputs, pkgs, config, ... }: let
identityPaths = [
	"/etc/ssh/ssh_host_ed25519_key"
	"/home/skultix/.ssh/agenix"
];
masterIdentities = [
	"/home/skultix/.ssh/agenix"
];
backupKeys = [
	"age10mkguxj35lec52xls4vraleq74mrfdl5sk2vu08t5gku8wtn9egsxftpva"
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
		extraEncryptionPubkeys = backupKeys;
		storageMode = "local";
		localStorageDir = ../.. + "/secrets/rekeyed/${config.networking.hostName}";
	};
}
// home {
	imports = [
		inputs.agenix.homeManagerModules.default
	];

	age.identityPaths = identityPaths;
}
