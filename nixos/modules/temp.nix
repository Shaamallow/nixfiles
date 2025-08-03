{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    # Nix setup
    nil
    nixfmt-rfc-style

    # Lua setup
    lua5_4_compat
    lua-language-server
    stylua
  ];
}
