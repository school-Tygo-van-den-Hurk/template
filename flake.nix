{
  description = "The flake used for building, checking and developing this school project.";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/release-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nix-github-actions.url = "github:nix-community/nix-github-actions";

    flake-parts.url = "github:hercules-ci/flake-parts";

    pre-commit-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs = {
        flake-compat.follows = "flake-compat";
        nixpkgs.follows = "nixpkgs";
      };
    };

    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ flake-parts, ... }:
    let
      overlays = import ./nix/overlays inputs;
    in
    flake-parts.lib.mkFlake { inherit inputs; } rec {

      imports = [ ];

      systems = [
        "x86_64-linux"
      ];

      flake = {
        inherit overlays;
        githubActions = inputs.nix-github-actions.lib.mkGithubMatrix {
          checks = inputs.nixpkgs.lib.getAttrs systems (
            # check whether the packages can be build for every platform,
            # but for linux also do the other checks. Prevents duplicated
            # checking for non-package builds.
            inputs.self.packages // { inherit (inputs.self.checks) x86_64-linux; }
          );
        };
      };

      perSystem =
        {
          config,
          system,
          ...
        }:
        let

          pkgs = import inputs.nixpkgs {
            overlays = builtins.attrValues overlays;
            inherit system;
          };

          inherit (inputs) treefmt-nix pre-commit-hooks;

          treefmtEval = treefmt-nix.lib.evalModule pkgs ./.config/treefmt.nix;
          pre-commit-check = pre-commit-hooks.lib.${system}.run (import ./.config/pre-commit.nix pkgs);

        in
        rec {
          # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Nix Flake Check ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

          checks = packages // {
            formatting = treefmtEval.config.build.check inputs.self;
            inherit pre-commit-check;
          };

          # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Nix Fmt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

          formatter = treefmtEval.config.build.wrapper;

          # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Nix Develop ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

          devShells.default = pkgs.mkShell {
            inherit (pre-commit-check) shellHook;
            buildInputs =
              pre-commit-check.enabledPackages
              ++ (with pkgs; [
                act # Run / check GitHub Actions locally.
                git # Pull, commit, and push changes.
              ]);
          };

          # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Nix Run ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

          apps =
            let
              scripts = import ./nix/scripts pkgs;
            in
            builtins.mapAttrs (name: script: {
              type = "app";
              program = "${builtins.toString script}/bin/${name}";
              inherit (script) meta;
            }) scripts;

          # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Nix Build ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

          packages = import ./nix/packages pkgs;

          # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
        };
    };
}
