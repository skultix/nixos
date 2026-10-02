{ lib, config, ... }: with lib; let
hostname = config.networking.hostName;
identityType = (with types; submodule {
	options = {
		ssh-pubkey = mkOption { type = str; };
	};
});
in {
	options.identities = mkOption {
		default = {};
		type = types.submodule ({ config, ... }: {
			freeformType = types.attrsOf identityType;

			options.this = mkOption {
				type = types.raw;
				readOnly = true;
				default = config.${hostname};
				defaultText = "config.identities.\${config.networking.hostName}";
			};
		});
	};
}
