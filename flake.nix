{
  description = "My personal setup";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixCats.url = "github:BirdeeHub/nixCats-nvim";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    # nvim packages
    "material.nvim" = {
      url = "github:marko-cerovac/material.nvim";
      flake = false;
    };
  };

  outputs = inputs@{self, nixpkgs, home-manager, ... }:
    let
      # ---- SYSTEM SETTINGS ---- #
      systemSettings = {
        system = "x86_64-linux";
        hostname = "nixos";
        timezone = "Australia/Melbourne";
        locale = "en_AU.UTF-8";
      };
  
      # ---- USER SETTINGS ---- #
      userSettings = {
        username = "armout";
        name = "Armin";
        gh-user = "arm-out";
        email = "arminsuraj@gmail.com";
        dotfilesDir = "~/.dotfiles";
      };
   in {
     nixosConfigurations = {
       nixos = nixpkgs.lib.nixosSystem {
         system = systemSettings.system;
         modules = [ 
           ./system/configuration.nix

           home-manager.nixosModules.home-manager {
             home-manager.useGlobalPkgs = true;
             home-manager.useUserPackages = true;
             home-manager.backupFileExtension = "backup";
             home-manager.users.armout = ./home.nix;
             home-manager.extraSpecialArgs = {
               inherit systemSettings;
               inherit userSettings;
               inherit inputs;
             };
           }

         ];
         specialArgs = {
           inherit systemSettings;
           inherit userSettings;
         };
       };
     };
  
   };
}
