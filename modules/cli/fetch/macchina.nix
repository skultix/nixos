{ home, pkgs, ... }: home {
	home.packages = with pkgs; [
		macchina
	];

	xdg.configFile."macchina/macchina.toml".text = ''
	theme = "custom"
	show = ["Host", "Kernel", "Distribution", "Memory", "DiskSpace", "Uptime"]
	disks = ["/"]
	'';

	xdg.configFile."macchina/themes/custom.toml".text = ''
	spacing = 2
	padding = 0
	separator = ""

	prefer_small_ascii = true
	hide_ascii = true

	key_color = "#cba6f7"
	separator_color = "Blue"

	[box]
	# title = "Balls"
	border = "rounded"
	visible = true

	[keys]
	host = "󰌢"
	kernel = ""
	distro = ""
	memory = ""
	disk_space = ""
	uptime = ""
	'';
}
