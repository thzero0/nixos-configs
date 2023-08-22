
{inputs, lib, config, pkgs, ...}:

{

 nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  home = {
    username = "thzero";
    homeDirectory = "/home/thzero";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [
	steam
	neovim
	ranger
	wofi
	alacritty	
	firefox
	discord
	swww
	spotify
	lshw
	vscodium
	zathura
	feh
	zip
	unzip
	pavucontrol
	
  ];

}
