{ inputs, ... }: {
	nix.registry = {
		stable.flake = inputs.stable;
	};
}
