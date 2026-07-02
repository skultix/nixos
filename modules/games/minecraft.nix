{ pkgs, lib, config, inputs, ... }: let
minecraft = config.cfg.games.minecraft;
lunar-client-package = inputs.lunar-client.packages.${pkgs.stdenv.hostPlatform.system}.default;
in {
	options = {
		cfg.games.minecraft = {
			enable = lib.mkOption {
				default = true;
			};
			
			clients = {
				badlion = lib.mkEnableOption "enable Badlion Client";
				lunar = lib.mkEnableOption "enable Lunar Client";
			};
		};
	};

	config = lib.mkIf minecraft.enable {
		environment.systemPackages = with pkgs; [
			(prismlauncher.override {
				additionalPrograms = [ ffmpeg ];
				jdks = [
					graalvmPackages.graalvm-ce
					zulu8
					zulu17
					zulu
				];
			})
		]
		++ lib.optional minecraft.clients.badlion badlion-client
		++ lib.optional minecraft.clients.lunar lunar-client-package
		;

		# For hosting servers
		networking.firewall = {
			allowedTCPPorts = [ 25565 25575 ]; # Java
			allowedUDPPortRanges = [{ from=19132; to=19132; }]; # Bedrock
		};
	};
}
