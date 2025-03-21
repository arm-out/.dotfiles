{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    ghostty
  ];
  
  programs.fish.enable = true;
  programs.fish.shellAliases = {
    r = "sudo nixos-rebuild switch --flake ~/.dotfiles";
    gc = "sudo nix-collect-garbage -d && nix-collect-garbage -d";
    opt = "nix-store --optimise";
    ".." = "cd ..";
  };
}

