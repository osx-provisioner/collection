#!/bin/bash

# Interface to code formatters inside the CICD-Tools container.
# Requires the docker CLI binary: https://www.docker.com/

# CICD-Tools script.

set -eo pipefail

# shellcheck source=./.cicd-tools/boxes/bootstrap/libraries/logging.sh
source "$(dirname -- "${BASH_SOURCE[0]}")/../boxes/bootstrap/libraries/logging.sh"

main() {
  _fmt "$@"
  log "INFO" "TOOLING CONTAINER > Command completed successfully."
}

_fmt() {

  local COMMAND
  local PREFIX

  _fmt_shell() {
    poetry run pre-commit run --hook-stage manual format-shell --all-files
  }

  _fmt_toml() {
    poetry run pre-commit run --hook-stage manual format-toml --all-files
  }

  _fmt_usage() {
    log "ERROR" "format.sh -- interface to the CICD-Tools code formatters."
    log "ERROR" "USAGE: format.sh [COMMAND] [FILES]"
    log "ERROR" "  COMMANDS:"
    log "ERROR" "  toml   - Format the specified TOML file."
    log "ERROR" "  shell  - Format the specified shell file."
    exit 127
  }

  PREFIX="_fmt"
  COMMAND="${PREFIX}_${1}"
  if [[ $(type -t "${COMMAND}") == function ]]; then
    shift
    "${COMMAND}" "$@"
  else
    "${PREFIX}_usage"
  fi

}

main "$@"
