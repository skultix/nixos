{ ... }: {
	services.upower = {
		enable = true;
		percentageLow = 40;
		percentageCritical = 20;
	};
}
