{ home, ... }: home {
	programs.fd = {
		enable = true;
		ignores = [
			".git/"
		];
	};
}
