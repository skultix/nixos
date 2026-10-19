{ lib, config, inputs, pkgs, ... }: {
	imports = [ inputs.opendeck.nixosModules.default ];

	options.cfg.hardware.stream-deck.enable = lib.mkEnableOption "enable stream deck";

	config = lib.mkIf config.cfg.hardware.stream-deck.enable {
		# programs.streamcontroller.enable = true;
		programs.opendeck.enable = true;

		environment.systemPackages = with pkgs; [ wineWowPackages.stable ];
	};
}
