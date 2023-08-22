# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, lib, config, pkgs, ... }:

{
  programs.hyprland.enable = true;
  programs.fish.enable = true;
 
  imports =
    [ 

    ./hardware-configuration.nix
    ../system-modules/grubBoot.nix
    ../system-modules/Audio
    ../system-modules/Networking
    ../system-modules/Keymap	

    ];




  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.thzero = {
    isNormalUser = true;
    description = "thzero";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ home-manager ];
  };



  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix = {
	registry = lib.mapAttrs (_: value: {flake = value; }) inputs;
	nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;
	settings = {
		experimental-features = "nix-command flakes";
		auto-optimise-store = true;
	};
  };




  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
	git
	python3
     	acpi
	gcc
	gnumake
  ];



  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };


  # List services that you want to enable:


  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
