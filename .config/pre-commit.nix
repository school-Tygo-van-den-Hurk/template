{
  src = ./..;
  hooks = {

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
        ignored-words = [
          "Tygo"
          "tygo"
          "Hurk"
          "hurk"
        ];
      };
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

  };
}
