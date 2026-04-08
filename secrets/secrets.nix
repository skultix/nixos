let
# Users
general = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJIUYF8wHGZq8uCyOSWcPhOCf470Fcw+83YP8cidxg7/";
themarlstar = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB6jY+FoWs0h5DRK+Mh7yTwzARxbWCLdVZdt1XngRzhf";

# Machines
skultik = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIObrpAJDZ9pEX5APzCxe7+V1vurKtUe1Pwe0WXOVTXPk";
machines = [ skultik ];

defaults = [ general ] ++ machines;
in
{
	# <== WiFi ==>
	"wifi/eduroam.age".publicKeys = defaults;
	"wifi/uq.age".publicKeys = defaults;

	# <== Wireguard ==>
	"wg/protonvpn-brisbane.age".publicKeys = defaults;

	# <== Cloud storage ==>
	# Google Drive
	"cloud/google-drive/client_id.age".publicKeys = defaults;
	"cloud/google-drive/client_secret.age".publicKeys = defaults;
	"cloud/google-drive/token.age".publicKeys = defaults;
	# Proton Drive
	"cloud/proton-drive/username.age".publicKeys = defaults;
	"cloud/proton-drive/password.age".publicKeys = defaults;
	"cloud/proton-drive/client_uid.age".publicKeys = defaults;
	"cloud/proton-drive/client_access_token.age".publicKeys = defaults;
	"cloud/proton-drive/client_refresh_token.age".publicKeys = defaults;
	"cloud/proton-drive/client_salted_key_pass.age".publicKeys = defaults;
}
