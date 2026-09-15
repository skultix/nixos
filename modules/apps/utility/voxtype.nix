{ home, inputs, pkgs, ... }: home {
	imports = [ inputs.voxtype.homeManagerModules.default ];

	programs.voxtype = {
		enable = true;
		package = inputs.voxtype.packages.${pkgs.stdenv.hostPlatform.system}.vulkan;
		service.enable = true;

		model.name = "base.en";
		settings = {
			hotkey = {
				enable = true;
				key = "SCROLLLOCK";
				mode = "push_to_talk";
				cancel_key = "ESC";
			};
		};
	};

	home.packages = [
		# inputs.voxtype.packages.${pkgs.stdenv.hostPlatform.system}.osd-native
		inputs.voxtype.packages.${pkgs.stdenv.hostPlatform.system}.osd-gtk4
	];

	programs.niri.settings.binds = {
		"Mod+Comma".action.spawn-sh = "voxtype record toggle";
	};
}
