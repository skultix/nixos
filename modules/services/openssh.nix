{ config, ... }: {
	services.openssh = {
		enable = true;
	};

	users.users.skultix.openssh.authorizedKeys.keys = builtins.map
	(identity: identity.ssh-pubkey)
	(builtins.attrValues config.identities);
}
