{ home, ... }: home {
	programs.niri.settings = {
		binds = let
		locked-spawn-sh = action: {
			allow-when-locked = true;
			action.spawn-sh = action;
		};
		in {
			# Audio control keys
			XF86AudioRaiseVolume = locked-spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+ -l 1.0";
			XF86AudioLowerVolume = locked-spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-";
			XF86AudioMute = locked-spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
			XF86AudioMicMute = locked-spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
		};
	};
}
