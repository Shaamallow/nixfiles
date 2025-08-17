# Chromium configuration
{ ... }:
{
  # usefull config for pupeteer
  programs.chromium = {
    enable = true;
    extensions = [
      { id = "ddkjiahejlhfcafbddmgiahcphecmpfh"; } # Ublock lite
      { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } # Dark Reader
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
    ];
  };
}
