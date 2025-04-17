{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    ghostty
    starship
  ];

  home.file = {
    ".config/ghostty/config".source = ./config;
  };
  
  programs.fish = {
    enable = true;
    shellAliases = {
      r = "sudo nixos-rebuild switch --flake ~/.dotfiles";
      gc = "sudo nix-collect-garbage -d && nix-collect-garbage -d";
      opt = "nix-store --optimise";
      dot = "cd ~/.dotfiles";
      ".." = "cd ..";
    };
    interactiveShellInit = "set fish_greeting '' & starship init fish | source";
  };
}

