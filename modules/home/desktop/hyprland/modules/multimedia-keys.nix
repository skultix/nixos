{ ... }: {
	wayland.windowManager.hyprland.settings = {
		# Laptop multimedia keys for volume and LCD brightness
		bindel = [
			",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
			",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
			",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
			",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

			# Now handled by `programs.light.brightnessKeys`
			# ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
			# ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
		];

		# Requires playerctl
		bindl = [
			", XF86AudioNext, exec, playerctl next"
			", XF86AudioPause, exec, playerctl play-pause"
			", XF86AudioPlay, exec, playerctl play-pause"
			", XF86AudioPrev, exec, playerctl previous"
		];
	};
}
