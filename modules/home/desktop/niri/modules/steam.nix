{ ... }: {
	programs.niri.settings = {
		window-rules = [
			{
				matches = [
					{ app-id = "steam"; title = "Steam"; }
				];
				open-fullscreen = true;
			}
		];
	};
}
