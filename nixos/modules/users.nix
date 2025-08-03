{
  config,
  pkgs,
  ...
}:
{

  users.users.shaamallow = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    shell = pkgs.zsh;
  };
}
