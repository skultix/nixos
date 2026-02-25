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
	# WiFi
	"wifi/eduroam.age".publicKeys = defaults;
}
