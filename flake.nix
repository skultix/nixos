{
	description = "Nixos config flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		agenix = {
			url = "github:ryantm/agenix";
			inputs.darwin.follows = ""; # no need for apple stuff on nixos
		};

		hyprland.url = "github:hyprwm/Hyprland";
		hyprland-plugins = {
			url = "github:hyprwm/hyprland-plugins";
			inputs.hyprland.follows = "hyprland";
		};
		hypr-dynamic-cursors = {
			url = "github:VirtCode/hypr-dynamic-cursors";
			inputs.hyprland.follows = "hyprland";
		};

		millennium = {
			url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		stylix = {
			url = "github:nix-community/stylix";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		tinted-schemes = {
			flake = false;
			url = "github:tinted-theming/schemes";
		};

		import-tree.url = "github:vic/import-tree";
	};

	outputs = { self, nixpkgs, ... }@inputs: let
		mkSystem = name: nixpkgs.lib.nixosSystem {
			specialArgs = { inherit inputs; };
			modules = [
				./hosts/${name}/configuration.nix
				(inputs.import-tree ./modules/nixos)
				(inputs.import-tree.match "\\(?!secrets\.nix\\)" ./secrets)
				inputs.agenix.nixosModules.default
				./modules/unfree.nix
				{ networking.hostName = name; }
				inputs.home-manager.nixosModules.default
				inputs.stylix.nixosModules.stylix
			];
		};
	in {
		nixosConfigurations.skultikpc = mkSystem "skultikpc";
		nixosConfigurations.skultik = mkSystem "skultik";
	};
}
