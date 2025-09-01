> This is where we keep the derivations for our packages.

[< Back to nix module README...](../README.md)

# Packages

- [Packages](#packages)
  - [Overview](#overview)

## Overview

This directory is for keeping nix derivations or nix packages. This could be dependencies that NixPkgs didn't have, or our own packages we create in this repository. To add a package:

1. Add a directory
1. create a `default.nix` file in `$dir/default.nix`

- This file has to return a derivation when imported.

3. do not forget to stage this directory `git add $dir/` after you are done
1. use `nix build .#$dir` to test that this derivation builds.
