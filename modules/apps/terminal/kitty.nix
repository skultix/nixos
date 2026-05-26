{ home, ... }: home {
	programs.kitty = {
		enable = true;
		settings = {
			window_padding_width = "0 6";
		};
		keybindings = {
			"kitty_mod+t" = "new_tab_with_cwd";
		};
	};
}
