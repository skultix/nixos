{ home, ... }: home {
	programs.niri.settings = {
		# Disable client-side window decorations
		prefer-no-csd = true;
	};
}
