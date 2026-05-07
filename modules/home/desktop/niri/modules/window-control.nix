{ ... }: {
	programs.niri.settings = {
		binds = let
		focus = direction: { action."focus-${direction}" = {}; };
		move = direction: { action."move-${direction}" = {}; };
		move-column-to-workspace = ws: { action.move-column-to-workspace = ws; };
		consume-or-expel-window = direction: { action."consume-or-expel-window-${direction}" = {}; };
		in {
			# Window control
			"Mod+Q" = {
				repeat = false;
				action.close-window = {};
			};
			"Mod+Shift+Q" = {
				repeat = false;
				action.spawn-sh = "kill $(niri msg --json focused-window | jq '.pid')";
			};

			# Window navigation
			"Mod+H" = focus "column-left";
			"Mod+J" = focus "window-down";
			"Mod+K" = focus "window-up";
			"Mod+L" = focus "column-right";
			"Mod+Home" = focus "column-first";
			"Mod+End" = focus "column-last";
			# Window movement
			"Mod+Shift+H" = move "column-left";
			"Mod+Shift+J" = move "window-down";
			"Mod+Shift+K" = move "window-up";
			"Mod+Shift+L" = move "column-right";
			# to different workspaces
			"Mod+Shift+1" = move-column-to-workspace 1;
			"Mod+Shift+2" = move-column-to-workspace 2;
			"Mod+Shift+3" = move-column-to-workspace 3;
			"Mod+Shift+4" = move-column-to-workspace 4;
			"Mod+Shift+5" = move-column-to-workspace 5;
			"Mod+Shift+6" = move-column-to-workspace 6;
			"Mod+Shift+7" = move-column-to-workspace 7;
			"Mod+Shift+8" = move-column-to-workspace 8;
			"Mod+Shift+9" = move-column-to-workspace 9;
			# in/out of columns
			"Mod+BracketLeft" = consume-or-expel-window "left";
			"Mod+BracketRight" = consume-or-expel-window "right";
			# resizing
			"Mod+F".action = { maximize-column = {}; };
			"Mod+Shift+F".action = { fullscreen-window = {}; };
			"Mod+Minus".action = { set-column-width = "-10%"; };
			"Mod+Equal".action = { set-column-width = "+10%"; };
			"Mod+Shift+Minus".action = { set-window-height = "-10%"; };
			"Mod+Shift+Equal".action = { set-window-height = "+10%"; };
			# floating
			"Mod+V".action = { toggle-window-floating = {}; };
			"Mod+Shift+V".action = { switch-focus-between-floating-and-tiling = {}; };
			# tabbed
			"Mod+W".action = { toggle-column-tabbed-display = {}; };
			# center
			"Mod+Shift+C".action = { center-window = {}; };
		};
	};
}
