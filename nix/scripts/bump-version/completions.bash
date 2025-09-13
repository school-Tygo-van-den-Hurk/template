# shellcheck shell=bash
# shellcheck disable=SC2034

_bump_version() {
  local cur prev
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD - 1]}"

  # suggest flags if current word starts with -
  local opts="-h --help -v --verbose -q --quiet -i --ignore-changes -t --to"
  mapfile -t COMPREPLY < <(compgen -W "$opts" -- "$cur")
  return 0
}

complete -F _bump_version bump-version
