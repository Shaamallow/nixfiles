{ lib, ... }:
with lib;
{
  programs.git = {
    delta = {
      enable = true;
      options = {
        features = "decorations";
        dark = true;
        side-by-side = true;

        interactive.keep-plus-minus-markers = false;

        decorations = {
          commit-decoration-style = "blue ol";
          commit-style = "raw";
          file-style = "omit";
          hunk-header-decoration-style = "blue box";
          hunk-header-file-style = "red";
          hunk-header-line-number-style = "#067a00";
          hunk-header-style = "file line-number syntax";
        };
      };
    };

    lfs.enable = true;
    extraConfig = {
      core.editor = "nvim";
      init.defaultBranch = "main";
    };

    ignores = [
      ".DS_Store"
      "*.swp"
      "node_modules/"
      "dist/"
    ];
  };
}
