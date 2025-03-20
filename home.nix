{ config, pkgs, ... }:

{
  imports = [
    ./programs
  ];

  home.username = "armout";
  home.homeDirectory = "/home/armout";

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
