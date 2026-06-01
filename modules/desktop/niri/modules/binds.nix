{ home, config, lib, ... }: let
program = config.cfg.programs;
bind = b: action: to: { ${b}.action.${action} = to; };
bind-sh = b: to: bind b "spawn-sh" to;
in home {
	programs.niri.settings.binds = lib.mergeAttrsList [
		# Workspace navigation
		(bind "Mod+1" "focus-workspace" 1)
		(bind "Mod+2" "focus-workspace" 2)
		(bind "Mod+3" "focus-workspace" 3)
		(bind "Mod+4" "focus-workspace" 4)
		(bind "Mod+5" "focus-workspace" 5)
		(bind "Mod+6" "focus-workspace" 6)
		(bind "Mod+7" "focus-workspace" 7)
		(bind "Mod+8" "focus-workspace" 8)
		(bind "Mod+9" "focus-workspace" 9)
		# Workspace control
		(bind "Mod+Control+U" "move-workspace-up" {})
		(bind "Mod+Control+D" "move-workspace-down" {})

		# Window navigation
		(bind "Mod+H" "focus-column-left" {})
		(bind "Mod+J" "focus-window-down" {})
		(bind "Mod+K" "focus-window-up" {})
		(bind "Mod+L" "focus-column-right" {})
		(bind "Mod+Home" "focus-column-first" {})
		(bind "Mod+End" "focus-column-last" {})
		(bind "Mod+U" "focus-workspace-up" {})
		(bind "Mod+D" "focus-workspace-down" {})
		# Window control | movement
		(bind "Mod+Shift+H" "move-column-left" {})
		(bind "Mod+Shift+J" "move-window-down" {})
		(bind "Mod+Shift+K" "move-window-up" {})
		(bind "Mod+Shift+L" "move-column-right" {})
		# Window control | workspaces
		(bind "Mod+Shift+1" "move-column-to-workspace" 1)
		(bind "Mod+Shift+2" "move-column-to-workspace" 2)
		(bind "Mod+Shift+3" "move-column-to-workspace" 3)
		(bind "Mod+Shift+4" "move-column-to-workspace" 4)
		(bind "Mod+Shift+5" "move-column-to-workspace" 5)
		(bind "Mod+Shift+6" "move-column-to-workspace" 6)
		(bind "Mod+Shift+7" "move-column-to-workspace" 7)
		(bind "Mod+Shift+8" "move-column-to-workspace" 8)
		(bind "Mod+Shift+9" "move-column-to-workspace" 9)
		(bind "Mod+Shift+U" "move-column-to-workspace-up" {})
		(bind "Mod+Shift+D" "move-column-to-workspace-down" {})
		# Window control | columns
		(bind "Mod+BracketLeft" "consume-or-expel-window-left" {})
		(bind "Mod+BracketRight" "consume-or-expel-window-right" {})
		# Window resizing
		(bind "Mod+F" "maximize-column" {})
		(bind "Mod+Shift+F" "fullscreen-window" {})
		(bind "Mod+Minus" "set-column-width" "-10%")
		(bind "Mod+Equal" "set-column-width" "+10%")
		(bind "Mod+W" "switch-preset-column-width" {})
		(bind "Mod+Shift+W" "switch-preset-column-width-back" {})
		(bind "Mod+Control+W" "expand-column-to-available-width" {})
		(bind "Mod+Shift+Minus" "set-window-height" "-10%")
		(bind "Mod+Shift+Equal" "set-window-height" "+10%")
		# Window control | floating
		(bind "Mod+V" "toggle-window-floating" {})
		(bind "Mod+Shift+V" "switch-focus-between-floating-and-tiling" {})
		# Window control | tabbed columns
		(bind "Mod+Shift+T" "toggle-column-tabbed-display" {})
		# Window control | positioning
		(bind "Mod+Shift+C" "center-window" {})

		# Program control
		(bind "Mod+Q" "close-window" {})
		(bind-sh "Mod+Shift+Q" "kill $(niri msg --json focused-window | jq '.pid')")

		# Programs
		(bind-sh "Mod+Return" program.terminal)
		(bind-sh "Mod+Space" program.launcher)
		(bind-sh "Mod+E" program.file-manager)
		(bind-sh "Mod+Slash" program.file-search)
		(bind-sh "Mod+B" program.password-manager)
		(bind-sh "Mod+C" program.clipboard-manager)
		(bind-sh "Mod+Shift+Escape" program.system-monitor)
		(bind-sh "Mod+Control+L" program.lock)
		(bind-sh "Mod+S" program.bar.peek)

		# Screenshot
		(bind "Mod+Shift+S" "screenshot" {})

		# Overview
		(bind "Mod+O" "toggle-overview" {})
	];
}
