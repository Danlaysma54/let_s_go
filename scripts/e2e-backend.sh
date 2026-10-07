#!/usr/bin/env bash

set -euo pipefail

compose=(docker compose --env-file .env.e2e -f compose.e2e.yml)

cleanup() {
  "${compose[@]}" down -v
}

trap cleanup EXIT

"${compose[@]}" up -d --build --wait
curl --fail --silent --show-error "${API_BASE_URL:-http://localhost:58080}/api/v1/system/ping"
curl --fail --silent --show-error "${API_BASE_URL:-http://localhost:58080}/actuator/health"
