{ inputs, lib, config, pkgs, ... }:

{

  boot.loader = {
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot";
	
    grub = {
    	enable = true;
	devices = [ "nodev" ];
	efiSupport = true;
	useOSProber = true;
	configurationLimit = 5;
	efiInstallAsRemovable = true;

  };

};
