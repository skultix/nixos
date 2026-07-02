{ pkgs, ... }: let
sddm-astronaut-theme = (pkgs.sddm-astronaut.override {
	themeConfig = {
		# FullBlur = true;
		# BlurMax = 32;
		# Blur = 1.0;
		FullBlur = false;
		PartialBlur = false;
	};
});
in {
	environment.systemPackages = with pkgs; [
		sddm-astronaut-theme
	];

	services.displayManager.sddm = {
		enable = true;
		wayland.enable = true;
		wayland.compositor = "kwin";
		autoNumlock = true;
		theme = "sddm-astronaut-theme";
		extraPackages = with pkgs; [
			sddm-astronaut-theme
		];
	};
}
