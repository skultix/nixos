{ home, pkgs, ... }: home {
	programs.gh = {
		enable = true;
		settings = {
			git_protocol = "ssh";
		};
		extensions = with pkgs; [
			gh-stack
		];
	};
}
