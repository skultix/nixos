{ home, config, pkgs, ... }: {
	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
		withUWSM = true;
	};
} // home {
	wayland.windowManager.hyprland = {
		enable = true;
		systemd.enable = false;
		# Set by the nixos module rather than hm
		package = null;
		# keep main config in lua rather than nix
		extraConfig = "require(\"root\")";
	};

	xdg.configFile."hypr/.luarc.json".text = builtins.toJSON {
		# LSP stubs for the `hl` object in lua
		workspace.library = [ "${pkgs.hyprland}/share/hypr/stubs" ];
	};

	xdg.configFile."uwsm/env".source = "${config.hm.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh";
}
