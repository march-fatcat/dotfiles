#!/usr/bin/env bash
set -euo pipefail

expected_account="march-fatcat"
actual_account="$(gh api user --jq '.login' 2>/dev/null || true)"

if [[ "$actual_account" != "$expected_account" ]]; then
  echo "Refusing GitHub write: active gh account is '${actual_account:-unknown}', expected '$expected_account'." >&2
  echo "Run: gh auth switch --user $expected_account" >&2
  exit 1
fi

echo "GitHub write identity verified: $actual_account"
