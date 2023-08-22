{inputs, lib, config, pkgs, ...}:

{

	services.pipewire = {
		enable = true;
		alsa.enable = true;
		pulse.enable = true;
		jack.enable = true;
	};

}
