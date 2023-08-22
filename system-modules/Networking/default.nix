{inputs, lib, config, pkgs, ...}:

{
	networking.hostName = "BlackHole"; # Define my hostname
	
	# networking.wireless.enable = true; # Enables wireless support via wpa_supplicant

	# Configures network proxy if necessary
	# networking.proxy.default = "http://user:password@proxy:port/";
	# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

	# Enable networking
	networking.networkmanager.enable = true;

}
