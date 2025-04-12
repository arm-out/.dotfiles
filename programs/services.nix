{config, pkgs, ... }:

{
  home.packages = with pkgs; [
    protonup
  ];

  services.easyeffects.enable = true;
}
