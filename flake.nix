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

		cachyos-kernel = {
			url = "github:xddxdd/nix-cachyos-kernel/release";
			# do not override nixpkgs
		};

		claude-switch = {
			url = "github:Marlstar/claude-switch-fish";
			flake = false;
		};

		claude-desktop = {
			url = "github:aaddrick/claude-desktop-debian";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		eh = {
			url = "github:notashelf/eh";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		disko = {
			url = "github:nix-community/disko";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		flatpak.url = "github:gmodena/nix-flatpak";

		lunar-client ={
			url = "github:clonidine/lunar-client-flake";
		};

		niri = {
			url = "github:sodiboo/niri-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		noctalia = {
			url = "github:noctalia-dev/noctalia-shell";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		millennium = {
			url = "github:SteamClientHomebrew/Millennium/next?dir=packages/nix";
			# doesn't follow nixpkgs as this causes hash mismatches
			# https://github.com/SteamClientHomebrew/Millennium/issues/551#issuecomment-4463419857
		};

		paseo = {
			url = "github:getpaseo/paseo";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		stylix = {
			url = "github:nix-community/stylix";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		steam-config = {
			url = "github:different-name/steam-config-nix";
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
			specialArgs = {
				inherit inputs;
				home = tbl: { hm = tbl; };
			};
			modules = [
				./hosts/${name}/configuration.nix
				{ networking.hostName = name; }
				(nixpkgs.lib.mkAliasOptionModule [ "hm" ] [ "home-manager" "users" "themarlstar" ])

				./modules/unfree.nix
				(inputs.import-tree ./modules/apps)
				(inputs.import-tree ./modules/appearance)
				(inputs.import-tree ./modules/nixos)
				(inputs.import-tree.match "\\(?!secrets\.nix\\)" ./secrets)
				inputs.agenix.nixosModules.default
				inputs.eh.nixosModules.default
				inputs.flatpak.nixosModules.nix-flatpak
				inputs.home-manager.nixosModules.default
				inputs.paseo.nixosModules.default
				inputs.stylix.nixosModules.stylix
				inputs.niri.nixosModules.niri
			];
		};
	in {
		nixosConfigurations.skultikpc = mkSystem "skultikpc";
		nixosConfigurations.skultik = mkSystem "skultik";
	};
}
