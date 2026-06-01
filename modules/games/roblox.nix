{ home, ... }: home {
	services.flatpak = {
		packages = [
			"org.vinegarhq.Sober"
		];

		overrides.settings."org.vinegarhq.Sober" = {
			Context = {
				filesystems = [
					"xdg-run/app/com.discordapp.Discord:create"
					"xdg-run/discord-ipc-0"
				];
			};
		};
	};
}
