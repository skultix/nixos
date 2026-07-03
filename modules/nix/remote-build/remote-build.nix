{ config, lib, ... }: let
public-key = lib.trim (builtins.readFile ./nix-builder.pub);
private-key = config.age.secrets."remote-build/private-key".path;
is-pc = config.networking.hostName == "skultikpc";
in lib.mkMerge [
	(lib.mkIf is-pc { # Remote builder on the PC
		users.users.nixbld-remote = {
			isNormalUser = true;
			openssh.authorizedKeys.keys = [ public-key ];
		};

		nix.settings.trusted-users = [ "nixbld-remote" ];
	})
	(lib.mkIf (!is-pc) { # Use the PC remote builder on other devices
		nix.distributedBuilds = true;
		nix.settings.builders-use-substitutes = true;
		nix.buildMachines = [{
			hostName = "skultikpc-nix-builder";
			systems = [ "x86_64-linux" ];
			maxJobs = 8;
			speedFactor = 4;
			publicHostKey = config.identities.skultikpc.ssh-pubkey;
			sshKey = private-key;
			protocol = "ssh-ng";
			supportedFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];
		}];

		programs.ssh.extraConfig = ''
		Host skultikpc-nix-builder
		HostName skultikpc
		User nixbld-remote
		IdentityFile ${private-key}
		ConnectTimeout 5
		StrictHostKeyChecking yes
		'';

		age.secrets."remote-build/private-key" = {
			file = ../../../secrets/remote-build/private-key.age;
			path = "/root/.ssh/nix-builder";
			owner = "root";
			group = "root";
			mode = "0600";
		};
	})
]
