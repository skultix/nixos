{ pkgs, ... }: {
	users.users.skultix.shell = pkgs.fish;

	programs.bash.enable = true;
	programs.zsh.enable = true;
	programs.fish.enable = true;
}
