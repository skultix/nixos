{ pkgs, ... }: let
equicord-upd = (pkgs.equicord.overrideAttrs (oldAttrs: {
	version = "2026-01-25";
	src = pkgs.fetchFromGitHub {
		owner = "Equicord";
		repo = "Equicord";
		tag = "2026-02-08";
		hash = "sha256-uk4kF6i00jAnHQ8ldjTjO4zv0S+OmMZ5zOqfRb8XWS8=";
	};
}));
in {
	programs.discord = {
		enable = true;
		settings = {
			SKIP_HOST_UPDATE = true;
			DANGEROUS_ENABLE_DEVTOOLS_ONLY_ENABLE_IF_YOU_KNOW_WHAT_YOURE_DOING = true;
		};
		package = (pkgs.discord.override {
			withEquicord = true;
			equicord = equicord-upd;
			# withOpenASAR = true;
			disableUpdates = false; # home-manager does this
		});
	};

	home.packages = [
		equicord-upd
	];

	xdg.autostart.entries = [
		"${pkgs.discord}/share/applications/discord.desktop"
	];
}
