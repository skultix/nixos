{ lib, inputs, config, pkgs, ... }: {
	options = {
		cfg.users.main = {
			enable = lib.mkEnableOption "enable user themarlstar";
			username = lib.mkOption {
				default = "themarlstar";
			};
			shell = lib.mkOption {
				default = pkgs.fish;
			};
			groups = lib.mkOption {
				type = lib.types.listOf lib.types.str;
				default = [ "wheel" "input" "uinput" ];
			};
			home = "/home/${config.cfg.users.main.username}";
		};
	};

	config = lib.mkIf config.cfg.users.main.enable {
		cfg.users.main.groups = lib.mkBefore [ "wheel" "input" "uinput" ];
		users.users.${config.cfg.users.main.username} = {
			isNormalUser = true;
			extraGroups = config.cfg.users.main.groups ++ [ "wheel" ];
			home = "/home/${config.cfg.users.main.username}";
			shell = config.cfg.users.main.shell;
		};

		home-manager = {
			extraSpecialArgs = { inherit inputs; };
			users = {
				"${config.cfg.users.main.username}" = import ../../../home.nix;
			};
		};
	};
}
