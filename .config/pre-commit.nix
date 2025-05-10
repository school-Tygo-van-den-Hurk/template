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
    mdl = {
      enable = true;
      settings = {
        rules = [
          # https://github.com/markdownlint/markdownlint/blob/main/docs/RULES.md
          "MD001"
          "MD002"
          "MD003"
          "MD005"
          "MD006"
          "MD010"
          "MD011"
          "MD012"
          "MD014"
          "MD018"
          "MD019"
          "MD020"
          "MD021"
          "MD022"
          "MD023"
          "MD024"
          "MD025"
          "MD026"
          "MD027"
          "MD029"
          "MD030"
          "MD031"
          "MD032"
          "MD034"
          "MD035"
          "MD037"
          "MD038"
          "MD039"
          "MD040"
          "MD046"
          "MD047"

        ];
      };
    };

  };
}
