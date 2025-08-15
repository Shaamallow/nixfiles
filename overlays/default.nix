{ inputs, ... }:
{
  stable = [
    inputs.rust-overlay.overlays.default
    inputs.nur.overlays.default

  ];
  unstable = [
    inputs.rust-overlay.overlays.default
    inputs.nur.overlays.default

  ];
}
