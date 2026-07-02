{ home, pkgs, ... }: home {
	home.packages = with pkgs; [
		# Compilers
		gcc
		llvm

		# Build systems
		cmake

		# Linkers
		lld
	];
}
