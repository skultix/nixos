{ lib, ... }: with lib; {
	options.identities = mkOption {
		type = (with types; attrsOf (submodule {
			options = {
				ssh-pubkey = mkOption { type = str; };
			};
		}));
		default = {};
	};
}
