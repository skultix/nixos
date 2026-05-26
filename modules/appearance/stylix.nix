{ inputs, pkgs, ... }: {
	stylix = {
		enable = true;
		polarity = "dark";
		base16Scheme = "${inputs.tinted-schemes}/base16/catppuccin-mocha.yaml";
		fonts = {
			monospace = {
				name = "JetBrains Mono Nerd Font";
				package = pkgs.nerd-fonts.jetbrains-mono;
			};
		};
		fonts.sizes = {
			terminal = 14;
		};
	};
}
