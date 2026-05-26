{ home, stable, ... }: home {
	home.packages = [
		stable.nodePackages.vercel
	];
}
