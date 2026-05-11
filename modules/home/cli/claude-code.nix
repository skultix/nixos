{ inputs, pkgs, ... }: {
	programs.claude-code = {
		enable = true;
	};

	home.packages = with pkgs; [
		claude-monitor
	];

	programs.fish = {
		shellAbbrs.ccs = "claude-switch";

		# claude-switch (my script)
		programs.fish.plugins = [{
			name = "claude-switch";
			src = inputs.claude-switch;
		}];
	};
}
