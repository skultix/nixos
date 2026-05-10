{ inputs, ... }: {
	programs.claude-code = {
		enable = true;
	};

	# claude-switch (my script)
	programs.fish.plugins = [{
		name = "claude-switch";
		src = inputs.claude-switch;
	}];
}
