{ config, pkgs, ... }:
{

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    bat
    chezmoi
    dust
    fastfetch
    fd
    fzf
    gcc
    git
    home-manager
    imagemagick
    jq
    just
    kitty
    lazydocker
    lazygit
    lsd
    ncdu
    neovim
    nixfmt-rfc-style
    ripgrep
    stow
    tldr
    tmux
    vim
    wget
    xclip
    zoxide
  ];
}
