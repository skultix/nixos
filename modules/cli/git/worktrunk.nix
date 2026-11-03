{ home, pkgs, ... }: home {
	programs.worktrunk = {
		enable = true;
		# claudeCodeIntegration.enable = true;
	};

	home.packages = with pkgs; [
		worktrunk-sync
	];
}
