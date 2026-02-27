{ pkgs, ... }: {
    programs.hyprland = {
		enable = true;
		xwayland.enable = true;
    };

    environment.systemPackages = with pkgs; [ kitty ];

    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
    };
}
