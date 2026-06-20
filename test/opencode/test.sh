#!/usr/bin/env bash
# Dev Container Feature test script
# See: https://github.com/devcontainers/cli/blob/main/docs/devcontainer-features-test.md
set -e

source dev-container-features-test-lib

check "opencode installed" bash -c "command -v opencode"
check "opencode version" bash -c "opencode --version"
check "opencode-web-start helper exists" bash -c "command -v opencode-web-start"
check "OPENCODE_DATA_DIR is set" bash -c "[ -n '${OPENCODE_DATA_DIR}' ]"
check "gitignore snippet exists" bash -c "[ -f /usr/local/share/opencode-feature/gitignore-snippet.txt ]"

reportResults
