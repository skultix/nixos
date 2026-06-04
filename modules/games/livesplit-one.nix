{ inputs, ... }: {
	imports = [ inputs.livesplit-one.nixosModules.default ];

	programs.livesplit-one.enable = true;
}
