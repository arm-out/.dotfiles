{ pkgs, ... }:

{
  imports = [
    ./desktop
    ./shell
  ];

  home.packages = with pkgs; [
  ];

}
