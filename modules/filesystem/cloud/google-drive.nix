{ home, config, ... }: (home {
	programs.rclone.remotes.google-drive = {
		mounts."" = {
			enable = true;
			autoMount = true;
			mountPoint = "/home/skultix/cloud/google-drive";
		};
		secrets = let
		secret = name: config.age.secrets."cloud/google-drive/${name}".path;
		in {
			client_id = secret "client_id";
			client_secret = secret "client_secret";
			token = secret "token";
		};
		config = {
			type = "drive";
			scope = "drive";
			team_drive = "";
		};
	};
}) // {
	age.secrets = {
		"cloud/google-drive/client_id" = {
			file = ../../../secrets/cloud/google-drive/client_id.age;
			owner = "skultix";
		};
		"cloud/google-drive/client_secret" = {
			file = ../../../secrets/cloud/google-drive/client_secret.age;
			owner = "skultix";
		};
		"cloud/google-drive/token" = {
			file = ../../../secrets/cloud/google-drive/token.age;
			owner = "skultix";
		};
	};
}
