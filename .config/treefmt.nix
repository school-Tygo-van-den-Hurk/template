_: {
  projectRootFile = "flake.nix";

  programs = {
    nixfmt.enable = true; # nix
    statix.enable = true; # nix static analysis
    deadnix.enable = true; # find dead nix code
  };
}
