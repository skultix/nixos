{ home, ... }: home {
	programs.fish = {
		enable = true;
		interactiveShellInit = ''
		set fish_greeting # disable fish greeting message
		'';
	};
}
