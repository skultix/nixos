{ config, lib, ... }: let
program = config.cfg.programs;
bind = bind: action: to: { binds.${bind}.action.${action} = to; };
bind-sh = action: to: bind "spawn-sh" action to;
in {
	programs.niri.settings.binds = lib.mergeAttrsList [
		bind-sh "Mod+Return" program.terminal
		bind-sh "Mod+Space" program.launcher
		bind-sh "Mod+E" program.file-manager
		bind-sh "Mod+Slash" program.file-search
		bind-sh "Mod+B" program.password-manager
		bind-sh "Mod+C" program.clipboard-manager
		bind-sh "Mod+Shift+Escape" program.system-monitor
		bind-sh "Mod+Control+L" program.lock
	];
}
