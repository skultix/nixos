{ home, ... }: home {
	programs.fastfetch = {
		enable = true;
		settings = {
			logo = {
				source = ./nixos.png;
				type = "kitty";
				height = 18;
				padding = {
					top = 2;
					left = 2;
				};
			};

			display.separator = " ";

			modules = [
				"break"
				"break"
				{
					type = "title";
					keyWidth = 10;
				}
				"break"
				{
					type = "os";
					key = " ";
					keyColor = "34";  # = color4
				}
				{
					type = "kernel";
					key = " ";
					keyColor = "34";
				}
				{
					type = "packages";
					format = "{1} (nix)";
					key = "󰏗 ";
					keyColor = "34";
				}
				{
					type = "shell";
					key = " ";
					keyColor = "34";
				}
				{
					type = "terminal";
					key = " ";
					keyColor = "34";
				}
				{
					type = "wm";
					key = " ";
					keyColor = "34";
				}
				{
					type = "display";
					key = "󰹑 ";
					keyColor = "34";
				}
				{
					type = "cpu";
					format = "{1}";
					key = " ";
					keyColor = "34";
				}
				{
					type = "gpu";
					format = "{2} [{3}]";
					key = "󱤓 ";
					keyColor = "34";
				}
				# {
				# 	type = "gpu"
				# 	format = "{3}"
				# 	key = " "
				# 	keyColor = "34"
				# }
				{
					type = "memory";
					key = " ";
					keyColor = "34";
				}
				{
					type = "swap";
					key = "󰾴 ";
					keyColor = "34";
				}
				{
					type = "disk";
					key = " ";
					keyColor = "34";
				}
				{
					type = "uptime";
					key = " ";
					keyColor = "34";
				}
				# {
				# 	type = "command"
				# 	key = "󱦟 "
				# 	keyColor = "34"
				# 	text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days"
				# }
				"break"
				{
					type = "custom";
					format = "{#90}  {#31}  {#32}  {#33}  {#34}  {#35}  {#36}  {#37}";
				}
				"break"
				"break"
			];
		};
	};
}
