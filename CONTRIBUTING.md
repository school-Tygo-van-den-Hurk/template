> In here we describe how to contribute, and the guidelines we set.

[< Back to main README...](./README.md)

# How to Develop

- [How to Develop](#how-to-develop)
  - [Getting started](#getting-started)
    - [Devcontainers](#devcontainers)
    - [Setup a new project](#setup-a-new-project)
  - [Building](#building)
  - [Testing](#testing)
    - [Pre-commit hooks](#pre-commit-hooks)
  - [Formatting](#formatting)
  - [Development shells](#development-shells)
  - [Continuous Integration & Continuous Delivery (CI/CD)](#continuous-integration--continuous-delivery-cicd)

## Getting started

There are several actions you might want to perform. Such as: build, check, or format code. First of all, make sure you have `Nix` installed. Check by running:

```sh
nix --version
```

Make sure that `Nix` is above version `2.16.0`, otherwise I cannot guarantee that this will work. There is a [devcontainer](#devcontainers) for those who are can't or don't have `Nix` installed.

### Devcontainers

if you don't have nix installed, you can use the devcontainer to issue all nix related commands. The devcontainer is a linux environment that has nix installed with flakes and nix-command enabled (these are experimental features).

When you enter a devcontainer it might take a while to pull the required image and set it all up. This will be faster after the first initial setup.

Look at the documentation for your IDE on how to work with devcontainers.

### Setup a new project

First you want to set up the project. This means that:

1. you wanna add the packages to the devShell in [`flake.nix`](flake.nix).
1. next, you wanna add formatters to [treefmt](.config/treefmt.nix), and [pre-commit](.config/pre-commit.nix). See [the treefmt-nix repo](https://github.com/numtide/treefmt-nix), and the [the git-hooks.nix repo](https://github.com/cachix/git-hooks.nix) for more information on how, and the configuration options.
1. Then you should add build scripts to build the packages. It is best practice to add the tests to the check phase.

Only the first person needs to do this. After that, you'll have a repo that uses deterministic build environments, formatters, tests, and build checks. It will even be checked before push, and on every commit using pre-commit.

## Building

To build run:

```sh
nix build
```

this will select the default package. If there is an error saying: "No default", type:

```sh
nix build .#
```

From here tab completion is your best friend. This will tell you what you can build. There might be a warning that the path is dirty, this means there are uncommitted changes, nothing to worry about.

A really nice flag to set is `--print-build-logs`. Add this to `nix build` to see the output of build (really nice if it fails). Use it like this:

```sh
nix build --print-build-logs .#
```

## Testing

To test run:

```SH
nix flake check
```

This will test the entire repository, including building, testing, formatting etc. There might be a warning that the path is dirty, this means there are uncommitted changes, nothing to worry about.

### Pre-commit hooks

I already added a bunch of pre-commit hooks. These run on commit or on push, they allow you to make sure that you're not adding typos, broken symlinks, binaries, and a bunch of other things. These pre-commit hooks have to be 'installed' This happens when you [enter a development shell](#development-shells). This install needs to be done the first time you enter the repo, and every time `.config/pre-commit.nix` is changed.

So make sure to run:

```sh
nix develop 
```

Read [more about devShells](#development-shells) if you want to learn more about this command.

## Formatting

To format the files, run:

```SH
nix fmt
```

This will format all files or which there is a formatter installed. There might be warnings that no formatter is installed for some files. This is fine, you can safely ignore those warnings.

## Development shells

To get the packages required for this project you enter a nix development shell. This will install all the packages and dependencies that this project needs. To enter a devShell run:

```sh
nix develop
```

To make it easy on yourself use [direnv](https://github.com/direnv/direnv). Run:

```sh
# recommended:
direnv allow
```

will put you into a nix development shell every time you enter this repository from the command line. The best part is that every time you pull it will apply the changes to the shell as well. For example, let's say that we pull and a package is added to the devShell, then dirEnv will reload, re-enter the devShell, download the missing package, install [the pre-commit hooks](#pre-commit-hooks) and voila: you are ready to code.

Development shell don't just add packages, they also set environment variables, or spin up services you might need. Because they are atomic, and deterministic we know that everything you code should be reproducible.

## Continuous Integration & Continuous Delivery (CI/CD)

The code you write will be automagically tested and deployed on changes to `main` or when you make a pull request. If a mistake was made then these checks will fail, denying merger with the `main` branch. See [how to test locally](#testing).

The most important test is: **Nix flake check**: these are the checks defined in the [flake](./flake.nix). You can try this one yourself by running: `nix flake check`. Most of the time this contains a couple standard tests:

- Are the packages buildable? Run `nix build .#PACKAGE_NAME` for each package to see if the build wasn't broken. It is easier to run `nix flake check` and see if it is a package that fails instead of a command for each package.
- Are the files properly formatted? You can fix any issues using `nix fmt`.
