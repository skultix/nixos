{ ... }: {
	programs.codex = {
		enable = true;
		settings = {
			tui = {
				status_line = ["model" "current-dir" "context-usage" "five-hour-limit" "weekly-limit"];
				terminal_title = ["project" "git-branch" "status" "thread" "task-progress"];
				vim_mode_default = true;
			};
		};
	};
}
