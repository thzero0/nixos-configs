
{inputs, lib, config, pkgs, ...}:

{
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
}
