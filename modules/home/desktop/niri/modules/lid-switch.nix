{ ... }: {
	programs.niri.settings = {
		switch-events = {
			lid-close.action.spawn = [ "noctalia-shell" "ipc" "call" "lockScreen" "lock" ];
		};
	};
}
