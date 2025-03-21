{ pkgs, ... }:

{
  imports = [
    ./desktop
    ./shell
    ./services.nix
  ];

  home.packages = with pkgs; [
  ];

}
