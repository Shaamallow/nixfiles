{
  pkgs,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Build tools
    cmake
    gnumake

    # Debuggers
    gdb
    valgrind

    # LSP & formatters
    clang-tools

    # Compilers (only one by default, as they conflict with each other)
    gcc
    # clang
  ];
}
