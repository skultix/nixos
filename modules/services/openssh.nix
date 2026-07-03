{ config, ... }: {
	services.openssh = {
		enable = true;
	};

	users.users.themarlstar.openssh.authorizedKeys.keys = builtins.map
	(identity: identity.ssh-pubkey)
	(builtins.attrValues config.identities);
}
