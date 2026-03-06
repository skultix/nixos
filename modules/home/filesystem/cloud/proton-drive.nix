{ config, ... }: {
	programs.rclone.remotes.proton-drive = {
		mounts."" = {
			enable = true;
			autoMount = true;
			# mountPoint = "${osConfig.cfg.users.main.home}/cloud/google-drive";
			mountPoint = "/home/themarlstar/cloud/proton-drive";
		};
		secrets = let
		secret = name: config.age.secrets."cloud/proton-drive/${name}".path;
		in {
			username = secret "username";
			password = secret "password";
		};
		config = {
			type = "protondrive";
		};
	};

	age.secrets = {
		"cloud/proton-drive/username".file = ../../../../secrets/cloud/proton-drive/username.age;
		"cloud/proton-drive/password".file = ../../../../secrets/cloud/proton-drive/password.age;
	};
}
