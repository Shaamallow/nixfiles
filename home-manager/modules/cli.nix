{
  pkgs,
  ...
}:
{
  # Basic CLI I want available on my user
  home.packages = with pkgs; [
    cmatrix
    neovim
  ];
}
