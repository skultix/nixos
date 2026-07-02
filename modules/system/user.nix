{ inputs, ... }: {
	users.users.themarlstar = {
		isNormalUser = true;
		uid = 1000;
		home = "/home/themarlstar";
		extraGroups = [ "wheel" ];
	};

	home-manager = {
		users.themarlstar = {
			home = {
				username = "themarlstar";
				homeDirectory = "/home/themarlstar";
			};
			imports = [ ../../home.nix ];
		};
		extraSpecialArgs = { inherit inputs; };
	};
}
