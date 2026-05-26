{ home, pkgs, ... }: let
tomlFormat = pkgs.formats.toml {};
in home {
	home.packages = with pkgs; [ bluetui ];

	xdg.configFile."bluetui/config.toml".source = tomlFormat.generate "config.toml" {
		layout = "SpaceAround";
		esc_quit = true;
	};
}
