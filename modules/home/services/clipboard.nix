{ pkgs, ... }: {
	services.wl-clip-persist = {
		enable = true;
	};

	home.packages = let
	wlclip-pkg = pkgs.wl-clipboard-rs;
	in [
		wlclip-pkg

		(pkgs.writeShellScriptBin "clip" ''
		if [ -t 0 ]; then
			${wlclip-pkg}/bin/wl-paste
		else
			${wlclip-pkg}/bin/wl-copy
		fi
		'')
	];
}
