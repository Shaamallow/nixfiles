{
  pkgs,
  ...
}:
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # Basic CLI I want available on my user
  home.packages = with pkgs; [
    bat
    cachix
    cmatrix
    delta
    dotacat
    dust
    fastfetch
    fd
    fzf
    imagemagick
    jq
    just
    lazydocker
    lazygit
    neovim
    nix-diff
    nix-output-monitor
    procs
    ripgrep
    stow
    tldr
    tmux
    zoxide
  ];
}
