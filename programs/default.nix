{ pkgs, inputs, systemSettings, ... }:

{
  imports = [
    ./desktop
    ./shell
    #./nvim
    ./services.nix
  ];

  home.packages = with pkgs; [
    inputs.zen-browser.packages."${system}".default
    discord
  ];

}
