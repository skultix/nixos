{ home, ... }: home {
	programs.ssh = {
		enable = true;
		enableDefaultConfig = false;
		settings = {
			"*" = {
				forwardAgent = true;
				addKeysToAgent = "yes";
				userKnownHostsFile = "~/.ssh/known_hosts";
				controlMaster = "no";
				controlPath = "~/.ssh/master-%r@%n:%p";
				controlPersist = "no";
			};
		};
	};

	services.ssh-agent.enable = true;
}
