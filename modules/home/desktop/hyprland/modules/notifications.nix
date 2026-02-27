{ ... }: {
	wayland.windowManager.hyprland.settings = {
		bind = [
			# "$mainMod, N, exec, swaync-client -t" # toggle
			# "$shiftMod, N, exec, swaync-client -C && swaync-client -cp" # remove latest notification and close
			"$mainMod, N, exec, noctalia-shell ipc call notifications toggleHistory"
			"$shiftMod, N, exec, noctalia-shell ipc call notifications clear"

			# reload
			# "$shiftMod, R, exec, swaync-client --reload-config & swaync-client -rs"
		];
	};
}
