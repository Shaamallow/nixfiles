{ ... }:
{
  imports = [
    ./modules/cli.nix
    ./modules/git.nix
    ./modules/gpu.nix
    ./modules/neovim.nix
  ];

  home = {
    username = "eyalb";
    homeDirectory = "/home/eyalb";
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "Shaamallow";
      user.email = "eyal.benaroche@gmail.com";
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.stateVersion = "25.05"; # Please read the comment before changing.
  programs.home-manager.enable = true;
}
