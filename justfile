# Just command helpers

help:
  echo "Helper commands to navigate NixOS configurations"

# Switch to a new NixOS generation
switch:
  sudo nixos-rebuild switch --flake .

shaamallow:
  home-manager switch --flake .

# Test a new NixOS generation
test:
  sudo nixos-rebuild test --flake .#main-laptop

# Rollback to the previous NixOS generation
rollback:
  sudo nixos-rebuild switch --rollback --flake .#main-laptop

# Update dotfiles symlinks
symlink:
  stow --target=$HOME/.config dotfiles
  stow --dir dotfiles --target=$HOME zsh
  stow --dir dotfiles --target=$HOME tmux 

# Remove all old nixos & home-manager generations, and collect garbage with home-manager expire-generations "-0 days"
prune:
  sudo nix-collect-garbage --delete-old

# Update nixpkgs unstable
update-nixpkgs:
  nix flake update nixpkgs
