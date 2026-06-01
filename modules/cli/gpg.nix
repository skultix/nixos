{ home, pkgs, ... }: home {
	programs.gpg = {
		enable = true;
	};

	services.gpg-agent = {
		enable = true;
		# pinentry.package = pkgs.pinentry-gtk2;
		pinentry.package = pkgs.pinentry-gnome3;

		defaultCacheTtl = 86400;
		maxCacheTtl = 86400;
		defaultCacheTtlSsh = 86400;
		maxCacheTtlSsh = 86400;
	};

	home.packages = with pkgs; [
		gcr
	];
}
