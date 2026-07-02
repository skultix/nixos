{ inputs, ... }: {
	users.users.themarlstar = {
		isNormalUser = true;
		uid = 1000;
		home = "/home/themarlstar";
		extraGroups = [ "wheel" ];
	};

	home-manager.extraSpecialArgs = {
		inherit inputs;
	};
}
