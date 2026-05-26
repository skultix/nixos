{ lib, pkgs, ... }: let 
deus-ex = pkgs.adi1090x-plymouth-themes.override {
	selected_themes = [ "deus_ex" ];
};
in {
	boot.plymouth = {
		enable = false;
		theme = lib.mkForce "deus_ex";
		themePackages = [ deus-ex ];
	};
}
