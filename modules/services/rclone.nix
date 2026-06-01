{ home, config, lib, ... }: let
replaceIllegalChars = builtins.replaceStrings [ "/" " " "$" ] [ "." "_" "" ];

rcloneMountOverrides = lib.concatMapAttrs (remoteName: remote:
lib.concatMapAttrs (mountPath: mountCfg: {
	"rclone-mount:${replaceIllegalChars mountPath}@${remoteName}" = {
		Unit.After = lib.mkForce [ "rclone-config.service" "network-online.target" ];
		Service.TimeoutStartSec = "10";
		Install.WantedBy = lib.mkForce [];
	};
}) remote.mounts
) config.programs.rclone.remotes;
inhome {
	programs.rclone.enable = true;
	systemd.user.services = rcloneMountOverrides;
}
