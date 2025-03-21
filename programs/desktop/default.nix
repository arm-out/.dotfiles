{ pkgs, config, ... }:

{
  home.file = {
    # Hyprland Config
    ".config/hypr/hyprland.conf".source = ./hyprland.conf;

    # Waybar Config
    ".config/waybar/config.jsonc".source = ./config.jsonc;
    ".config/waybar/colors.css".source = ./colors.css;
    ".config/waybar/style.css".source = ./style.css;
    ".config/waybar/wittr.sh".source = ./wittr.sh;

    # Fuzzel Config
    ".config/fuzzel/fuzzel.ini".source = ./fuzzel.ini;
  };

  home.packages = with pkgs; [
    fuzzel
    waybar
  ];

}
