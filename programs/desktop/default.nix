{ pkgs, config, userSettings, ... }:

{
  home.file = {
    # Hyprland Config
    ".config/hypr/hyprland.conf".source = ./hyprland.conf;

    # Waybar Config
    ".config/waybar/config.jsonc".source = ./waybar/config.jsonc;
    ".config/waybar/colors.css".source = ./waybar/colors.css;
    ".config/waybar/style.css".source = ./waybar/style.css;
    ".config/waybar/wittr.sh".source = ./waybar/wittr.sh;

    # Fuzzel Config
    ".config/fuzzel/fuzzel.ini".source = ./fuzzel.ini;

    # Hyprcursor
    ".icons/hyprmacOS" = {
      source = ./cursor/hyprcursor/macOS;
      recursive = true;
    };
    
    # Xcursor
    ".icons/macOS" = {
      source = ./cursor/xcursor/macOS;
      recursive = true;
    };
  };

  home.packages = with pkgs; [
    fuzzel
    waybar
    hyprpaper
    hyprcursor
    xdg-desktop-portal-hyprland
  ];

  # Wallpaper
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ (userSettings.dotfilesDir + "/programs/desktop/wallpaper.png") ];
      wallpaper = [ ("," + userSettings.dotfilesDir + "/programs/desktop/wallpaper.png") ];
   };
  };

}
