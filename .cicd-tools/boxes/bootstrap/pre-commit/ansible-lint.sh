#!/bin/bash

# Runs ansible-galaxy to install/update the dependencies if needed, and then runs ansible-lint on each active target folder's changes.

# @:  An array of folders to run ansible-lin on.

# pre-commit script.

set -eo pipefail

# shellcheck source=/dev/null
source "$(dirname -- "${BASH_SOURCE[0]}")/../libraries/tools.sh"

main() {
  local TARGET_FOLDERS=${*-"."}
  for TARGET in ${TARGET_FOLDERS}; do
    log "INFO" "PRE-COMMIT > Examining folder '${TARGET}' ..."
    pushd "${TARGET}" >> /dev/null
    if ! git diff requirements.yml; then
      log "DEBUG" "PRE-COMMIT > Detected a 'requirements.yml' file change."
      log "DEBUG" "PRE-COMMIT > Reinstalling the Ansible Galaxy requirements ..."
      cicd_tools "poetry" ansible-galaxy install --force --timeout 90 -r requirements.yml
    fi
    log "DEBUG" "PRE-COMMIT > Executing 'ansible-lint' ..."
    cicd_tools "poetry" ansible-lint
    popd >> /dev/null
  done
}

main "$@"
