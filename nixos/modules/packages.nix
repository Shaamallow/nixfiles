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
    imagemagick
    jq
    just
    kitty
    lsd
    lazygit
    lazydocker
    neovim
    ncdu
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
