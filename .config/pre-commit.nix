# See https://github.com/cachix/git-hooks.nix/blob/fa466640195d38ec97cf0493d6d6882bc4d14969/modules/hooks.nix
pkgs: {
  src = ./..;
  hooks = {

    # Run health checks on your flake-powered Nix projects.
    flake-checker = {
      enable = true;
      stages = [
        "pre-push"
        "manual"
      ];
    };

    # Check if the flake passes all it's checks. (takes a long time)
    nix-flake-check = {
      enable = true;
      name = "Nix Flake Check";
      entry = "nix flake check";
      pass_filenames = false;
      stages = [
        "pre-push"
        "manual"
      ];
    };

    # Ensure that all (non-binary) files with a shebang are executable.
    check-shebang-scripts-are-executable = {
      enable = true;
      stages = [
        "pre-commit"
        "pre-push"
        "manual"
      ];
    };

    # Detect the presence of private keys.
    detect-private-keys = {
      enable = true;
      stages = [
        "pre-commit"
        "pre-push"
        "manual"
      ];
    };

    # Checks for broken symlinks in the repository.
    check-symlinks = {
      enable = true;
      stages = [
        "pre-commit"
        "pre-push"
        "manual"
      ];
    };

    # Linting for your git commit messages"
    gitlint = {
      enable = true;
      stages = [
        "commit-msg"
      ];
    };

    # Check whether the current commit message follows committing rules.
    convco-check-commit-message =
      let

        name = "convco-check-commit-message";
        config = builtins.toFile "config.json" (builtins.toJSON (import ./convco.nix));
        custom-package = pkgs.writeShellScriptBin name ''
          set -e
          for arg in "$@"; do
            if [ -f "$arg" ]; then
              cat "$arg" | ${pkgs.convco}/bin/convco --config ${config} check --from-stdin
            else
              echo "No such file or directory: '$arg'" >&2
              exit 1
            fi
          done
        '';

      in
      rec {
        inherit name;
        enable = true;
        stages = [ "commit-msg" ];
        entry = "${custom-package}/bin/${name}";
        extraPackages = [ custom-package ];
      };

    convco-check-history =
      let

        name = "convco-check-commit-message";
        config = builtins.toFile "config.json" (builtins.toJSON (import ./convco.nix));
        custom-package = pkgs.writeShellScriptBin name ''
          set -e
          ${pkgs.convco}/bin/convco --config ${config} check
        '';

      in
      rec {
        inherit name;
        enable = true;
        entry = "${custom-package}/bin/${name}";
        extraPackages = [ custom-package ];
        stages = [
          "pre-push"
          "manual"
        ];
      };

    # disallows commits to certain branches.
    no-commit-to-branch = {
      enable = true;
      settings.branch = [ "main" ];
      stages = [
        "pre-commit"
        "pre-push"
        "manual"
      ];
    };

    # Prevents committing binaries.
    check-added-large-files = {
      enable = true;
      stages = [
        "pre-commit"
        "pre-push"
        "manual"
      ];
    };

    # Forces executable files to have a shebang.
    check-executables-have-shebangs = {
      enable = true;
      stages = [
        "pre-commit"
        "pre-push"
        "manual"
      ];
    };

    # Checks for spelling errors in both the files and commit messages.
    typos = {
      enable = true;
      stages = [
        "pre-commit"
        "commit-msg"
        "pre-push"
        "manual"
      ];
      settings = {
        no-unicode = true;
        hidden = true;
        exclude = "changelog.md";
        ignored-words = [
          "Tygo"
          "tygo"
          "Hurk"
          "hurk"
        ];
      };
    };

    # Ensures that a file is either empty, or ends with a single newline.
    end-of-file-fixer = {
      enable = true;
      stages = [
        "pre-push"
        "pre-commit"
        "manual"
      ];
    };

    # Checks markdown files for broken links, and bad syntax.
    mdformat = {
      enable = true;
      stages = [
        "pre-commit"
        "commit-msg"
        "pre-push"
        "manual"
      ];
    };

    nix-fmt =
      let
        nix-command = "--extra-experimental-features nix-command";
        flakes = "--extra-experimental-features flakes";
      in
      {
        enable = true;
        name = "nix-fmt";
        entry = "${pkgs.nix}/bin/nix ${nix-command} ${flakes} --offline fmt";
        pass_filenames = true;
        stages = [
          "pre-commit"
        ];
      };

    #! Requires an internet connection while in sandbox, thus does not work.
    # # Checks for broken links in Markdown files.
    # lychee = {
    #   enable = true;
    #   stages = [
    #     "pre-commit"
    #     "pre-push"
    #     "manual"
    #   ];
    # };

    #! Does not work properly, especially because formatters fight.
    # # Verify that the files are in harmony with the `.editorconfig`.
    # editorconfig-checker = {
    #   enable = true;
    #   stages = [
    #     "pre-commit"
    #     "pre-push"
    #     "manual"
    #   ];
    # };
  };

  # settings = {
  #   excludes = [
  #     "**/changelog.md"
  #   ];
  # };
}
