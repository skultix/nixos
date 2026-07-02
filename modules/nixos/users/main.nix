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
				default = [];
			};
			core-groups = lib.mkOption {
				default = [ "wheel" "input" "uinput" ];
			};
			home = "/home/${config.cfg.users.main.username}";
		};
	};

	config = let
	usercfg = config.cfg.users.main;
	in lib.mkIf usercfg.enable {
		users.users.${usercfg.username} = {
			isNormalUser = true;
			extraGroups = usercfg.core-groups ++ usercfg.groups;
			home = "/home/${usercfg.username}";
			shell = usercfg.shell;
			uid = 1000;
		};

		home-manager = {
			extraSpecialArgs = {
				inherit inputs;
			};
			users = {
				"${config.cfg.users.main.username}" = import ../../../home.nix;
			};
		};
	};
}
