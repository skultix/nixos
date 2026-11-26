{ home, pkgs, lib, ... }: home {
	home.packages = with pkgs; [ git-xet ];

	programs.git = {
		lfs.enable = true;

		settings.lfs.concurrenttransfers = 3;

		settings.lfs."customtransfer.xet" = {
			path = "${lib.getExe pkgs.git-xet}";
			args  = "transfer";
			concurrent = true;
		};
	};
}
