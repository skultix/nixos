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

		functions.env = {
			wraps = "env";
			description = "colourise env with rgrc for standalone env invocations only";
			body = ''
				if set -q argv[1]
					command env $argv
				else
					rgrc env
				end
			'';
		};
	};
}
