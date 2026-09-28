{ home, pkgs, lib, config, inputs, ... }: let
minecraft = config.cfg.games.minecraft;
lunar-client-package = inputs.lunar-client.packages.${pkgs.stdenv.hostPlatform.system}.default;
in {
	options = {
		cfg.games.minecraft = {
			enable = lib.mkOption {
				default = true;
			};
			
			clients = {
				lunar.enable = lib.mkEnableOption "enable Lunar Client";
				modrinth.enable = lib.mkOption { default = true; };
			};

			cubelify.enable = lib.mkOption {
				default = true;
			};
		};
	};

	config = lib.mkIf minecraft.enable ({
		# For hosting servers
		networking.firewall = {
			allowedTCPPorts = [ 25565 25575 ]; # Java
			allowedUDPPortRanges = [{ from=19132; to=19132; }]; # Bedrock
		};
	}
	// home {
		programs.prismlauncher = {
			enable = true;
			package = (pkgs.prismlauncher.override {
				additionalLibs = with pkgs; [
					wayland
					libxkbcommon
					libdecor
				];
				additionalPrograms = with pkgs; [ ffmpeg ];
				additionalLibs = with pkgs; [ dbus ];
				jdks = with pkgs; [
					graalvmPackages.graalvm-ce
					zulu8
					zulu17
					zulu
					zulu25
				];
			});
		};

		home.packages = with pkgs; []
		++ lib.optional minecraft.clients.lunar.enable lunar-client-package
		++ lib.optional minecraft.clients.modrinth.enable modrinth-app
		++ lib.optional minecraft.cubelify.enable cubelify
		;
	});
}
