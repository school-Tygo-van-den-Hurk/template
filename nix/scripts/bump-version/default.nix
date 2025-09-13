pkgs:
with pkgs;

let

  name = "bump-version";
  script = writeShellScriptBin name ''

    convco() {
      ${convco}/bin/convco "$@"
      return "$?"
    }

    git() {
      ${git}/bin/git "$@"
      return "$?"
    }

    ${builtins.readFile ./script.bash}
  '';
in

stdenv.mkDerivation rec {
  inherit name;
  src = ./.;

  buildPhase = ''
    runHook preBuild
    # ...
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir --parents $out/bin
    cp ${script}/bin/${name} $out/bin/${name}

    mkdir --parents $out/share/bash-completion/completions
    cp ${src}/completions.bash $out/share/bash-completion/completions/${name}.bash

    runHook postInstall
  '';
}
