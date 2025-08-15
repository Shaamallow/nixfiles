# Just command helpers

help:
  echo "Helper commands to navigate NixOS configurations"

# Switch to a new NixOS generation
switch:
  sudo nixos-rebuild switch --flake .

# Test a new NixOS generation
test:
  sudo nixos-rebuild test --flake .#main-laptop

# Rollback to the previous NixOS generation
rollback:
  sudo nixos-rebuild switch --rollback --flake .#main-laptop

# Update dotfiles symlinks
symlink:
  stow --target=$HOME dotfiles

# Remove all old nixos & home-manager generations, and collect garbage
#   home-manager expire-generations "-0 days"
prune:
  sudo nix-collect-garbage --delete-old  # Do not forget sudo, else it will not remove the old generations

# Update nixpkgs unstable
update-nixpkgs:
  nix flake update nixpkgs
