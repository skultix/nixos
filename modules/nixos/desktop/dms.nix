{ ... }: {
	programs.dms-shell = {
		enable = false;
		enableSystemMonitoring = true;
		enableAudioWavelength = true;
		enableVPN = true;
	};
}
