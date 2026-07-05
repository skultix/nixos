{
	description = "Nixos config flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		stable.url = "github:nixos/nixpkgs/nixos-25.11";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		agenix = {
			url = "github:ryantm/agenix";
			inputs.darwin.follows = ""; # no need for apple stuff on nixos
		};

		aspid = {
			url = "github:skultix/aspid";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		cachyos-kernel = {
			url = "github:xddxdd/nix-cachyos-kernel/release";
			# do not override nixpkgs
		};

		claude-switch = {
			url = "github:skultix/claude-switch-fish";
			flake = false;
		};

		claude-desktop = {
			url = "github:aaddrick/claude-desktop-debian";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		disko = {
			url = "github:nix-community/disko";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		eh = {
			url = "github:notashelf/eh";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		flatpak.url = "github:gmodena/nix-flatpak";

		handy = {
			url = "github:cjpais/Handy";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		livesplit-one = {
			url = "github:skultix/livesplit-one-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		lunar-client ={
			url = "github:clonidine/lunar-client-flake";
		};

		niri = {
			url = "github:sodiboo/niri-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nixcord.url = "github:4evy/nixcord";

		noctalia = {
			url = "github:noctalia-dev/noctalia";
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

		vercel-cli = {
			url = "github:skultix/vercel-cli-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		import-tree.url = "github:vic/import-tree";
	};

	outputs = { self, nixpkgs, stable, ... }@inputs: let
		identitiesModule = { identities = builtins.listToAttrs (
			builtins.map (
				sys: {
					name = sys;
					value = import ./hosts/${sys}/identity.nix;
				}
			) hostnames
		); };

		mkSystem = name: nixpkgs.lib.nixosSystem {
			specialArgs = {
				inherit inputs;
				home = tbl: { hm = tbl; };
			};
			modules = [
				./hosts/${name}/configuration.nix
				{ networking.hostName = name; }
				identitiesModule
				(nixpkgs.lib.mkAliasOptionModule [ "hm" ] [ "home-manager" "users" "skultix" ])

				(inputs.import-tree ./modules)
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

		systems = builtins.listToAttrs (
			builtins.map (
				hostname: {
					name = hostname;
					value = mkSystem hostname;
				}
			) hostnames
		);

		hostnames = [ "skultik" "skultikpc" ];
	in {
		nixosConfigurations = systems;
	};
}
