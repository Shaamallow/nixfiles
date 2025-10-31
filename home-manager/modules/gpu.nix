{
  pkgs,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.cudaSupport = true;

  home.packages = with pkgs; [
    nvtopPackages.full
  ];
}
