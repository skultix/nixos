{ config, ... }: {
	services.openssh = {
		enable = true;
	};

	users.users.themarlstar.openssh.authorizedKeys.keys = builtins.map
	(identity: identity.ssh-pubkey) config.identities;
}
