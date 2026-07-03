{ inputs, ... }: {
	users.users.skultix = {
		isNormalUser = true;
		uid = 1000;
		home = "/home/skultix";
		extraGroups = [ "wheel" ];
	};

	home-manager = {
		users.skultix = {
			home = {
				username = "skultix";
				homeDirectory = "/home/skultix";
			};
			imports = [ ../../home.nix ];
		};
		extraSpecialArgs = { inherit inputs; };
	};
}
