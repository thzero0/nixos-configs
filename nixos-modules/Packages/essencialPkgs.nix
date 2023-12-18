
{inputs, lib, config, pkgs, ...}:


{



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
	zip
	unzip
	pavucontrol
	valgrind
	slurp
	jdk17
  brightnessctl
  mysql80
  ];

}
