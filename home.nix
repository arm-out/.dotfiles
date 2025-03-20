{ config, pkgs, ... }:

{
  host.username = "armout";
  host.homeDirectory = "/home/armout";
  
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
