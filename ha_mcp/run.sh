#!/usr/bin/env bash
set -e

CONFIG="/data/options.json"

export HOMEASSISTANT_URL="$(jq -r '.homeassistant_url' "$CONFIG")"
export HOMEASSISTANT_TOKEN="$(jq -r '.homeassistant_token' "$CONFIG")"
export MCP_SECRET_PATH="$(jq -r '.secret_path' "$CONFIG")"
export MCP_PORT="8765"

echo "[ha-mcp add-on] HA URL: ${HOMEASSISTANT_URL}"
echo "[ha-mcp add-on] secret path: ${MCP_SECRET_PATH}"
echo "[ha-mcp add-on] listening on :${MCP_PORT} (streamable-http)"

# ha-mcp-web is the streamable-http transport: single path handles GET + POST.
exec ha-mcp-web
