{ config, ... }: {
	nix.extraOptions = ''
		!include ${config.age.secrets."nix/access-tokens".path}
	'';

	age.secrets."nix/access-tokens".rekeyFile = ../../secrets/nix/access-tokens.age;
}
