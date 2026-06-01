{ home, ... }: home {
	programs.niri.settings = {
		workspaces = {
			"01" = { name = "browser"; };
			"02" = { name = "communication"; };
			"03" = { name = "work"; };
		};
	};
}
