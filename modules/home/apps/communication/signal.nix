{ pkgs, ... }: let
flags = "--password-store=gnome-libsecret";
in {
	home.packages = with pkgs; [
		(symlinkJoin {
			name = "signal-desktop";
			paths = [ pkgs.signal-desktop ];
			buildInputs = [ pkgs.makeWrapper ];
			postBuild = ''
			wrapProgram $out/bin/signal-desktop \
				--add-flags "${flags}"
			'';
		})
	];
}
