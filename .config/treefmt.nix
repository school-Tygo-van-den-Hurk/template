_: {
  projectRootFile = "flake.nix";

  programs = {
    nixfmt.enable = true; # nix formatting
    statix.enable = true; # nix static analysis
    deadnix.enable = true; # find dead nix code
    mdformat.enable = true; # markdown formatting
    shfmt.enable = true; # Shell script formatting
    shellcheck.enable = true; # Shell script linting
  };
}
