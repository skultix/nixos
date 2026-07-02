{ home, pkgs, ... }: home {
	home.packages = with pkgs; [
		nodejs
		yarn
		typescript
		vitejs
	];

	programs.bun = {
		enable = true;
	};
}
