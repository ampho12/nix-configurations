{ config, pkgs, lib, ... }:

{
  home.username = "ampho"; # Replace with your username
  home.homeDirectory = "/home/ampho";

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "zsh-autosuggestions" "zsh-syntax-highlighting" ];
      theme = "powerlevel10k/powerlevel10k";
    };

    plugins = [
        {
            name = "powerlevel10k";
            src = pkgs.zsh-powerlevel10k;
            file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
        {
            name = "powerlevel10k-config";
            src = lib.cleanSource ./p10k-config;
            file = "p10k.zsh";
        }
    ];

  };

  # Symlink .zshrc and .p10k.zsh from repo
  home.file.".zshrc".source = ./config/zshrc;

  home.stateVersion = "23.11"; # Adjust based on your system version
}

