{ home, pkgs, ... }: let
jabref-with-chromium-host = pkgs.jabref.overrideAttrs (old: {
	installPhase = (old.installPhase or "") + ''
	install -Dm644 jabgui/buildres/linux/native-messaging-host/chromium/org.jabref.jabref.json $out/etc/chromium/native-messaging-hosts/org.jabref.jabref.json
	sed -i -e "s|/opt/jabref|$out|" $out/etc/chromium/native-messaging-hosts/org.jabref.jabref.chromium.json
	'';
});
in home {
	home.packages = [
		# jabref-with-chromium-host
		pkgs.jabref
	];

	# programs.vivaldi.nativeMessagingHosts = [
	# 	jabref-with-chromium-host
	# ];
}
