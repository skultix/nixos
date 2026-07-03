{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		neovim
		vim
	];

	environment.variables.MANPAGER = "nvim +Man!";
}
