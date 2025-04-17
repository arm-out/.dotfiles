{ pkgs, inputs, systemSettings, ... }:

{
  imports = [
    ./desktop
    ./shell
    #./nvim
    ./services.nix
    inputs.spicetify-nix.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    inputs.zen-browser.packages."${system}".default
    discord
  ];

  programs.spicetify = 
  let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in
  {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [ adblock ];
  };

}
