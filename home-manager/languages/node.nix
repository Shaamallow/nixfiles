{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    # Language (latest LTS node version)
    nodejs

    # Package managers
    yarn-berry
    bun
    pnpm

    # LSP
    typescript-language-server
    vscode-langservers-extracted
    tailwindcss-language-server
    svelte-language-server

    # Formatter
    nodePackages.prettier
  ];
}
