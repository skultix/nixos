{ home, pkgs, ... }: home {
	home.packages = with pkgs; [
		rgrc
	];

	programs.fish = let
	excludedAliases = builtins.concatStringsSep "," [ "env" "ls" ];
	in {
		interactiveShellInit = ''
		rgrc --aliases --except ${excludedAliases} | source
		'';
	};
}
