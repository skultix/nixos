{ ... }: {
	services.udiskie = {
		enable = true;
		settings = {
			program_options = {
				file_manager = "nautilus";
				terminal = "ghostty --working-directory=";
			};
			notifications = {
				timeout = 1.5;
				device_mounted = 3;
			};
		};
	};
}
