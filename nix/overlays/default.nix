inputs: {

  # This one brings our custom packages from the 'pkgs' directory through the flake into pkgs.
  add-flake-pkgs = final: _prev: {
    flake = import ../packages final.pkgs;
  };

  # Makes the unstable nixpkgs set accessible through 'pkgs.unstable'
  add-unstable-nixpkgs = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      inherit (final) system config;
    };
  };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  custom-overlays = _final: _prev: {
    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });
  };

}
