{ config, pkgs, ... }:

{
  home.username = "armout";
  home.homeDirectory = "/home/armout";

  home.packages = with pkgs; [
    ghostty
  ];
 
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
