{ home, ... }: home {
	programs.fish.shellAliases = {
		ls = "eza -a";
		reload = "source ~/.config/fish/config.fish";
	};
}
