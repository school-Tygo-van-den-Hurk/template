> In here we describe how to contribute, and the guidelines we set.

[< Back to main README...](./README.md)

> # Setup a new project
>
> First you want to set up the project. This means that:
>
> - [ ] Enable GitHub pages or remove the `deploy-github-pages` workflow.
> - [ ] First up you wanna name and describe the repository.
>   - [ ] find and replace `school-Tygo-van-den-Hurk/template` with the current `$user/$repo` in the entire code base.
>   - [ ] Change the description of the flake and the oneliner description at the top of the README.
>   - [ ] Add an overview paragraph to the README describing it in longer form copy this to the repo description.
> - [ ] you wanna add the packages to the devShell in [`flake.nix`](flake.nix).
> - [ ] next, you wanna add formatters to [treefmt](nix/config/treefmt.nix). See [the treefmt-nix repo](https://github.com/numtide/treefmt-nix) for more information on how, and the configuration options.
> - [ ] You can possibly checks to [pre-commit](nix/config/pre-commit.nix). See [the git-hooks.nix repo](https://github.com/cachix/git-hooks.nix) for more information on how, and the configuration options.
> - [ ] Initialize whatever template the programming language or tooling uses.
> - [ ] Then you should add build scripts to build the packages you just initialised. It is best practice to add the tests to the check phase.
> - [ ] Delete this section.
> - [ ] Commit what you just created to see if everything is checked properly. (amend the init commit and force push)
>
> Only the first person needs to do this. After that, you'll have a repo that uses deterministic build environments, formatters, tests, and build checks. It will even be checked before push, and on every commit using pre-commit.

# Contributing

- [Contributing](#contributing)
  - [Overview](#overview)
    - [Devcontainers](#devcontainers)
  - [Commit Message Conventions](#commit-message-conventions)
  - [Branch Naming Conventions](#branch-naming-conventions)
  - [Testing](#testing)
    - [Pre-commit hooks](#pre-commit-hooks)
    - [Continuous Integration and Continuous Delivery (CI/CD)](#continuous-integration-and-continuous-delivery-cicd)
  - [Formatting](#formatting)
  - [License](#license)

## Overview

**First of all, thank you for considering contributing to the project!** To ensure that your Pull Request gets merged, please follow the guidelines described in this document.

### Devcontainers

We use [Nix](https://nixos.org) for this project as it ensures that we are all using the same tools. Please make sure you have nix version 2.16.0 or higher and have the nix-command and flakes experimental options enabled.

If you don't have nix installed and can't install it for whatever reason then there is a devcontainer you can use. When you enter a devcontainer it might take a while to pull the required image and set it all up. This will be faster after the first initial setup. Look at the documentation for your IDE on how to work with devcontainers.

## Commit Message Conventions

All commit messages must follow the [conventional commit specification](https://www.conventionalcommits.org/en/v1.0.0/#specification). This is to autogenerate the changelog and keep commits constant. There are pre-commit checks to help you not push wrongly formed commits by mistake. Here is a list of allowed types:

- **feat**: For new features.
- **fix**: For bug fixes.
- **test**: For changes to tests.
- **docs**: For changes to the documentation.
- **deps**: For changes in dependencies.
- **ci**: For changes to the CI workflows.
- **refactor**: A code change that neither fixes a bug nor adds a feature.
- **perf**: A code change that improves performance.
- **style**: Changes that do not affect the meaning of the code (formatting).
- **build**: Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm).
- **chore**: Other changes that don't modify source or test files.
- **revert**: Reverts a previous commit.

## Branch Naming Conventions

Much like conventional commits we use conventional branch naming. This means that depending on what you're working on you should name your branch differently. For example:

- Name it `docs/*`, or `documentation/*` when working on documentation.
- Name it `feat/*`, or `feature/*` when working on a feature.
- Name it `bug/*`, `fix/*`, `bugfix`, or `fixes/*` when working on a bug fix.
- Name it `deps/*`, or `dependencies/*` when updating dependencies.

Where `*` describes your branch. So for example: `dependencies/update-xyz-from-v1.2.3-to-v4.5.6`. Make sure to use [kebab-case](https://developer.mozilla.org/en-US/docs/Glossary/Kebab_case).

These branch names will make it clear what your working on, and allows the [CI/CD](#continuous-integration-and-continuous-delivery-cicd) to label your PR better.

> [!NOTE]
> For a most up to date list of what branch names are used, go to [`.github/labeler.yml`](.github/labeler.yml), in there you can see a list of what "head-branches" are allowed and what they will be labeled.

## Testing

Most of the tests done are performed automatically. The tests we use are [pre-commit hooks](#pre-commit-hooks) for the most immediate feedback and [CI/CD](#continuous-integration-and-continuous-delivery-cicd) ensures everything is good before we merge!

To test run:

```SH
nix flake check
```

This will test the entire repository, including building, testing, formatting etc. There might be a warning that the path is dirty, this means there are uncommitted changes, nothing to worry about.

### Pre-commit hooks

As mentioned before we use pre-commit hooks. These run on commit or on push, they allow you to make sure that you're not adding typos, broken symlinks, binaries, and a bunch of other things. These pre-commit hooks have to be 'installed' This happens when you enter a development shell using `nix develop`. This install needs to be done the first time you enter the repo, and every time `nix/config/pre-commit.nix` is changed.

So make sure to run:

```sh
nix develop 
```

You can make this easier by allowing [direnv](https://direnv.net/) to run.

### Continuous Integration and Continuous Delivery (CI/CD)

When interacting with this repository CI/CD will run to give you feedback, or help us out with some things. Only when all tests pass will we consider merging.

## Formatting

To format the files, run:

```SH
nix fmt
```

This will format all files or which there is a formatter installed. There might be warnings that no formatter is installed for some files. This is fine, you can safely ignore those warnings.

## License

By contributing, you agree that your contributions will be licensed under the same licence as the rest of the repository.
