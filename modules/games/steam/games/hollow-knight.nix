{ inputs, pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		inputs.aspid.packages.${pkgs.stdenv.hostPlatform.system}.default
		lumafly
	];
}
