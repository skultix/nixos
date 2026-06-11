{ home, pkgs, ... }: home {
	programs.git = {
		enable = true;
		package = pkgs.gitFull;
		hooks = {
			commit-msg = ./hooks/commit-msg; # conventional commits warning hook
		};
		settings = {
			user = {
				name = "Marley Reeves";
				email = "marley@marlstar.com";
			};
			init = {
				defaultBranch = "main";
			};
			push = {
				autoSetupRemote = true;
			};
			fetch = {
				prune = true;
			};
			pull = {
				rebase = true;
			};
			merge = {
				conflictStyle = "zdiff3";
			};
			url = {
				"git@github.com:".insteadOf = "gh:";
				"git@gitlab.com:".insteadOf = "glab:";
				"git@github.com:Marleys-Uni-Work/".insteadOf = "uni:";
			};
			alias = {
				lg = "log --graph --pretty=format:'%Cred%h%d %Cgreen%ar %Cblue[%an]  %Creset%s'";
			};
		};
		signing = {
			signByDefault = true;
			format = "openpgp";
		};
		maintenance.enable = true;
	};
}
