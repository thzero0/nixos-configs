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
    ../nixos-modules/grubBoot.nix
    ../nixos-modules/Audio
    ../nixos-modules/Networking
    ../nixos-modules/Keymap	
    ../nixos-modules/Packages
    ];


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.thzero = {
    isNormalUser = true;
    description = "thzero";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ home-manager ];
  };

	xdg.portal = {enable = true; extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; };

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
