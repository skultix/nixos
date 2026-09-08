{ pkgs, ... }: let
labEnv = pkgs.python3.withPackages (ps: with ps; [
	jupyterlab
	jupyterlab-vim
]);

pythonEnv = pkgs.python3.withPackages (ps: with ps; [
	ipykernel # required
	numpy
	pandas
	matplotlib
	scipy
	scikit-learn
]);

logoPath = "${pythonEnv}/${pythonEnv.sitePackages}/ipykernel/resources";
in {
	services.jupyter = {
		enable = true;
		package = labEnv;
		port = 9111;
		password = "argon2:$argon2id$v=19$m=10240,t=10,p=8$SSeVfDayKtEl31+SFJ9wHA$1V+7H4bgDkC7F9b63yN+doP794GikCEuNsU/tNw0Nso";

		kernels.python3 = {
			displayName = "Python 3 [DS]";
			language = "python";
			argv = [
				"${pythonEnv.interpreter}"
				"-m" "ipykernel_launcher"
				"-f" "{connection_file}"
			];
			logo32 = "${logoPath}/logo-32x32.png";
			logo64 = "${logoPath}/logo-64x64.png";
		};
	};
}
