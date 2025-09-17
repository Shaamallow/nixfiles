{ ... }:
{
  imports = [
    ./modules/cli.nix
    ./modules/git.nix
    ./modules/gpu.nix
    ./modules/neovim.nix
    ./modules/dunst.nix

    ./applications/communication.nix
    # ./applications/chromium.nix
    ./applications/nextcloud.nix

    ./languages/c-cpp.nix
    ./languages/node.nix
    ./languages/rust.nix
  ];

  home = {
    username = "shaamallow";
    homeDirectory = "/home/shaamallow";
  };

  programs.git = {
    enable = true;
    userName = "Shaamallow";
    userEmail = "eyal.benaroche@gmail.com";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.stateVersion = "25.05"; # Please read the comment before changing.
  programs.home-manager.enable = true;
}
