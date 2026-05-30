{ ... }: {
	nix.settings = {
		trusted-users = [ "root" "@wheel" ];
		experimental-features = [ "nix-command" "flakes" ];
		download-buffer-size = 524288000; # Fixes the "download buffer full" warning
	};
}
