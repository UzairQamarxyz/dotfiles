{ config, pkgs, ... }:

{
  services.xserver = {
    # Enable the X11 windowing system.
    enable = true;
    exportConfiguration = true;

  
    # Enable the XFCE Desktop Environment.
    displayManager.lightdm.enable = true;
    desktopManager.xfce.enable = true;
  
    layout = "us";
    xkbVariant = "dvorak";
    xkbOptions = "caps:escape_shifted_capslock";
    autoRepeatDelay = 200;
    autoRepeatInterval = 100;
  
    libinput = {
      enable = true;
   
        
      # disabling mouse acceleration
      mouse = {
        accelProfile = "flat";
      };
  
      # disabling touchpad acceleration
      touchpad = {
        accelProfile = "flat";
        tappingDragLock = false;
      };
    };
  };

  # Configure console keymap
  console = {
  	# keyMap = "dvorak";
	useXkbConfig = true;
  };
}
