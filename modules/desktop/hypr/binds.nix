{ home, config, lib, pkgs, ... }: let
program = config.cfg.programs;
lua = lib.generators.mkLuaInline;
str = builtins.toJSON;
run = "${pkgs.runapp}/bin/runapp --";

bind' = opts: keys: dsp: { _args = [ keys (lua "hl.dsp.${dsp}") ] ++ lib.optional (opts != {}) opts; };
bind = bind' {};
# For IPC commands (noctalia, vicinae) that just message a running service
exec' = opts: keys: cmd: bind' opts keys "exec_cmd(${str cmd})";
exec = exec' {};
# For launching programs, so each one gets its own systemd unit
app = keys: cmd: exec keys "${run} ${cmd}";

workspaces = lib.range 1 9;
in home {
	home.packages = with pkgs; [ grimblast ];

	wayland.windowManager.hyprland.settings.bind = lib.flatten [
		# Workspace navigation
		(map (n: bind "SUPER + ${toString n}" "focus({ workspace = ${toString n} })") workspaces)

		# Window navigation
		(bind "SUPER + H" ''focus({ direction = "left" })'')
		(bind "SUPER + J" ''focus({ direction = "down" })'')
		(bind "SUPER + K" ''focus({ direction = "up" })'')
		(bind "SUPER + L" ''focus({ direction = "right" })'')
		# Window control | movement
		(bind "SUPER + SHIFT + H" ''window.move({ direction = "left" })'')
		(bind "SUPER + SHIFT + J" ''window.move({ direction = "down" })'')
		(bind "SUPER + SHIFT + K" ''window.move({ direction = "up" })'')
		(bind "SUPER + SHIFT + L" ''window.move({ direction = "right" })'')
		# Window control | workspaces
		(map (n: bind "SUPER + SHIFT + ${toString n}" "window.move({ workspace = ${toString n} })") workspaces)
		# Window control | groups (closest thing to niri's tabbed columns)
		(bind "SUPER + bracketleft" ''window.move({ into_group = "left" })'')
		(bind "SUPER + bracketright" ''window.move({ into_group = "right" })'')
		(bind "SUPER + SHIFT + bracketleft" "window.move({ out_of_group = true })")
		(bind "SUPER + SHIFT + T" "group.toggle()")
		# Window resizing
		(bind "SUPER + F" ''window.fullscreen({ mode = "maximized" })'')
		(bind "SUPER + SHIFT + F" ''window.fullscreen({ mode = "fullscreen" })'')
		(bind "SUPER + W" ''layout("togglesplit")'')
		(bind' { repeating = true; } "SUPER + minus" "window.resize({ x = -100, y = 0, relative = true })")
		(bind' { repeating = true; } "SUPER + equal" "window.resize({ x = 100, y = 0, relative = true })")
		(bind' { repeating = true; } "SUPER + SHIFT + minus" "window.resize({ x = 0, y = -100, relative = true })")
		(bind' { repeating = true; } "SUPER + SHIFT + equal" "window.resize({ x = 0, y = 100, relative = true })")
		# Window control | floating
		(bind "SUPER + V" ''window.float({ action = "toggle" })'')
		# Window control | positioning
		(bind "SUPER + SHIFT + C" "window.center()")
		# Window control | mouse (niri does this without binds)
		(bind' { mouse = true; } "SUPER + mouse:272" "window.drag()")
		(bind' { mouse = true; } "SUPER + mouse:273" "window.resize()")

		# Program control
		(bind "SUPER + Q" "window.close()")
		(bind "SUPER + SHIFT + Q" "window.kill()")

		# Programs
		(app "SUPER + Return" program.terminal)
		(exec "SUPER + space" program.launcher)
		(app "SUPER + E" program.file-manager)
		(app "SUPER + slash" program.file-search)
		(app "SUPER + B" program.password-manager)
		(exec "SUPER + C" program.clipboard-manager)
		(app "SUPER + SHIFT + Escape" program.system-monitor)
		(exec' { locked = true; } "SUPER + CONTROL + L" program.lock)
		(exec "SUPER + S" program.bar.peek)
		(exec "SUPER + N" program.notifications.toggle)
		(exec "SUPER + SHIFT + N" program.notifications.clear)

		# Screenshot
		(exec "SUPER + SHIFT + S" "grimblast --notify --freeze copysave area")
	];
}
