{ config, pkgs, userSettings, ... }:

{
  imports = [
    ./programs
    ./nvim
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
  };

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
