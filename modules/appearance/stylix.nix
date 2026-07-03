{ home, inputs, pkgs, lib, config, ... }: {
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

		# Stylix's kmscon target uses removed options (services.kmscon.extraConfig/fonts).
		# We don't use kmscon, so just disable the target.
		targets.kmscon.enable = false;
	};
}
// home {
	stylix = {
		targets.firefox.profileNames = [ "typst-preview" ];
	};
}
