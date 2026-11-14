{ pkgs, ... }: {
	programs.appimage = {
		enable = true;
		binfmt = true;
		package = pkgs.appimage-run.override {
			extraPkgs = pkgs: [
				pkgs.libgpg-error # needed by Loam (bundles libgcrypt but not its dep)
			];
		};
	};
}
