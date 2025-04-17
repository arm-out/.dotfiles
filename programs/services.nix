{config, pkgs, ... }:

{
  home.packages = with pkgs; [
    protonup
  ];
  
  # Audio mixer
  services.easyeffects.enable = true;

  # Hyprland idle daemon
  services.hypridle = {
    enable = true;
    settings = {
      general = {
	after_sleep_cmd = "hyprctl dispatch dpms on";
	ignore_dbus_inhibit = false;
	lock_cmd = "hyprlock";
      };

      listener = [
	{
	  timeout = 60;
	  on-timeout = "hyprctl dispatch dpms off";
	  on-resume = "hyprctl dispatch dpms on";
	}
        {
	  timeout = 300;
          on-timeout = "systemctl suspend";
        }
      ];
    };

  };
}
