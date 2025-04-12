{ config, pkgs, userSettings, ... }:

{
  imports = [
    ./programs
  ];

  home.username = userSettings.username;
  home.homeDirectory = "/home/" + userSettings.username;

  # GTK Theme
  gtk = {
    enable = true;
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  home.sessionVariables = {
    GTK_THEME = "Dracula";
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
