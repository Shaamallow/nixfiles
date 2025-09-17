{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    # Using Oxalica
    rust-bin.stable.latest.default

    rust-analyzer
  ];
}
