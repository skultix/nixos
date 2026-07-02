{ lib, config, ... }: let
address = share: "//172.16.200.99/${share}";
shares = [
	{ name = "home"; share = "Personal-Drive"; }
	{ name = "public"; share = "public"; }
];
timeout = 5;
unmount-after-idle-secs = 60;
in {
	options = {
		cfg.filesystems.home-nas = {
			enable = lib.mkEnableOption "enable home NAS";
			mounts-base = lib.mkOption {
				default = "/mnt/nas";
			};
		};
	};

	config = let
	cfg = config.cfg.filesystems.home-nas;
	base = cfg.mounts-base;

	in lib.mkIf cfg.enable {
		fileSystems = let
		creds = config.age.secrets."nas/creds".path;
		mkNasShare = share: {
			device = address share;
			fsType = "cifs";
			options = [
				"credentials=${creds}"
				# Auto mount
				"x-systemd.automount"
				# unmount after 60s inactive
				"x-systemd.idle-timeout=${toString unmount-after-idle-secs}"
				# mount timeouts
				"x-systemd.mount-timeout=${toString timeout}s"
				"x-systemd.device-timeout=${toString timeout}s"
				"_netdev" # mark as network dependent
				"noauto" # don't mount at boot
				"nofail" # don't fail hard
				# so I own the files and dirs
				"uid=${toString config.users.users.themarlstar.uid}"
				"gid=${toString config.users.groups.users.gid}"
				# rwxr-xr-x
				"file_mode=0755"
				"dir_mode=0755"
			];
		};
		in builtins.listToAttrs (
		builtins.map (s: {
			name = "${base}/${s.name}";
			value = mkNasShare s.share;
		}) shares
		);

		age.secrets."nas/creds".file = ../../../../secrets/nas/creds.age;
	};
}
