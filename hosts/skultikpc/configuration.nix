{ pkgs, ... }: {
	imports = [ ./hardware-configuration.nix ];

	# <== Already modularised ==>
	cfg = {
		hardware = {
			nvidia.enable = true;
		};

		users.main.enable = true;

		filesystems = {
			home-nas.enable = true;
		};

		games = {
			enable = true;
			steam.enable = true;
			epic.enable = true;
			minecraft = {
				enable = true;
				clients.lunar = true;
			};
			vr = {
				enable = true;
				sidequest.enable = true;
			};
		};
	};
	
	# <== To-be-modularised/organised ==>
	environment.systemPackages = with pkgs; [
		vim
		neovim
		wget
		stow
		rustup
	];

	# DO NOT CHANGE THIS, LIKE, EVER!!!
	system.stateVersion = "25.11";
}
