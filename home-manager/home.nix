# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, lib, config, pkgs, ... }: {
  
  imports = [
   
   # inputs.nix-colors.homeManagerModule
	../home-modules/studies/python.nix
	../home-modules/Packages
  ];


  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  programs.fish = {
  	enable = true;
  	interactiveShellInit = ''
		fish_add_path --append ~/.local/bin
		'';
};

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
