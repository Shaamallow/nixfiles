{
  pkgs,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    neovim

    # Nix setup
    nil
    nixfmt-rfc-style

    # Lua setup
    lua5_4_compat
    lua-language-server
    stylua
  ];
}
