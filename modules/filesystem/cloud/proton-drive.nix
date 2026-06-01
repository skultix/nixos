{ home, config, ... }: (home {
	programs.rclone.remotes.proton-drive = {
		mounts."" = {
			enable = true;
			autoMount = true;
			mountPoint = "/home/themarlstar/cloud/proton-drive";
		};
		secrets = let
		secret = name: config.age.secrets."cloud/proton-drive/${name}".path;
		in {
			username = secret "username";
			password = secret "password";
			client_uid = secret "client_uid";
			client_access_token = secret "client_access_token";
			client_refresh_token = secret "client_refresh_token";
			client_salted_key_pass = secret "client_salted_key_pass";
		};
		config = {
			type = "protondrive";
		};
	};
}) // {
	age.secrets = let
	mkSecrets = secrets: builtins.listToAttrs (map (secret: {
		name = "cloud/proton-drive/${secret}";
		value = { file = ../../../secrets/cloud/proton-drive/${secret}.age; };
	}) secrets);
	in mkSecrets [
		"username"
		"password"
		"client_uid"
		"client_access_token"
		"client_refresh_token"
		"client_salted_key_pass"
	];
}
