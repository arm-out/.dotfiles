{ pkgs, ... }:

{
  imports = [
    ./desktop
    ./shell
    ./nvim
    ./services.nix
  ];

  home.packages = with pkgs; [
  ];

}
