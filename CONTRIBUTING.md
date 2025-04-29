> In here we describe how to contribute, and the guidelines we set.

[< Back to main README...](./README.md) 

# How to Develop

- [How to Develop](#how-to-develop)
  - [Getting started](#getting-started)
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

