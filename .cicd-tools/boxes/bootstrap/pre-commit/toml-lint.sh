#!/bin/bash

# Runs tomll on the specified files and then runs diff to detect changes.

# 1:  The Docker image and tag to use.
# @:  An array of toml files to lint.

# pre-commit script.

set -eo pipefail

# shellcheck source=/dev/null
source "$(dirname -- "${BASH_SOURCE[0]}")/../libraries/logging.sh"

main() {
  local PRECOMMIT_TOMLL_DOCKER_IMAGE

  PRECOMMIT_TOMLL_DOCKER_IMAGE="${1}"
  shift

  log "DEBUG" "PRE_COMMIT > Docker Image: '${PRECOMMIT_TOMLL_DOCKER_IMAGE}'"

  for TOML_FILE in "$@"; do
    log "DEBUG" "PRE-COMMIT > tomll < ${TOML_FILE}"
    diff "${TOML_FILE}" <(docker run -i --rm "${PRECOMMIT_TOMLL_DOCKER_IMAGE}" tomll < "${TOML_FILE}")
    log "INFO" "PRE-COMMIT > ${TOML_FILE} passes!"
  done
}

main "$@"
