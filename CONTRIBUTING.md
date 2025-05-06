> In here we describe how to contribute, and the guidelines we set.

[< Back to main README...](./README.md) 

# How to Develop

- [How to Develop](#how-to-develop)
  - [Getting started](#getting-started)
    - [Setup a new project](#setup-a-new-project)
    - [Building](#building)
    - [Testing](#testing)
    - [Formatting](#formatting)
  - [Continuous Integration \& Continuous Delivery (CI/CD)](#continuous-integration--continuous-delivery-cicd)

## Getting started
There are several actions you might want to perform. Such as: build, check, or format code. First of all, make sure you have `Nix` installed. Check by running:

```sh
nix --version
```

Make sure that `Nix` is above version `2.16.0`, otherwise I cannot guarantee that this will work. There is a devcontainer for those who are can't or don't have `Nix` installed. Look at the documentation for your IDE on how to work with devcontainers. 

### Setup a new project
First you want to set up the project. This means that:
1. you wanna add the packages to the devShell in [`flake.nix`](flake.nix).
2. next, you wanna add formatters to [`treefmt`](.config/treefmt.nix). See [the treefmt-nix repo](https://github.com/numtide/treefmt-nix) for more information on how. 
3. Then you should add build scripts to build the packages. It is best practice to add the tests to the check phase.

Only the first person needs to do this. After that, you'll have a repo that uses deterministic build environments, formatters, tests, and build checks. It will even be checked before push.

### Building
To build run:

```sh
nix build
```

this will select the default package. If there is an error saying: "No default", type:

```sh
nix build .#
```

From here tab completion is your best friend. This will tell you what you can build. There might be a warning that the path is dirty, this means there are uncommitted changes, nothing to worry about.

### Testing
To test run:

```SH
nix flake check
```

This will test the entire repository, including building, testing, formatting etc. There might be a warning that the path is dirty, this means there are uncommitted changes, nothing to worry about.

### Formatting
To format the files, run:

```SH
nix fmt
```

This will format all files or which there is a formatter installed. There might be warnings that no formatter is installed for some files. This is fine, you can safely ignore those warnings.

## Continuous Integration & Continuous Delivery (CI/CD)
The code you write will be automagically tested and deployed. If a mistake was made then these checks will fail, denying merger with the `main` branch. See [how to test locally](#testing).

