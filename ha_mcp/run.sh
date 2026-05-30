#!/usr/bin/env bash
set -e

CONFIG="/data/options.json"

# Trim surrounding whitespace (gsub) — a stray space pasted into the secret_path
# or token would otherwise serve the endpoint at the wrong URL / break HA auth.
export HOMEASSISTANT_URL="$(jq -r '.homeassistant_url | gsub("^\\s+|\\s+$";"")' "$CONFIG")"
export HOMEASSISTANT_TOKEN="$(jq -r '.homeassistant_token | gsub("^\\s+|\\s+$";"")' "$CONFIG")"
export MCP_SECRET_PATH="$(jq -r '.secret_path | gsub("^\\s+|\\s+$";"")' "$CONFIG")"
export MCP_PORT="8765"

echo "[ha-mcp add-on] HA URL: ${HOMEASSISTANT_URL}"
echo "[ha-mcp add-on] secret path: ${MCP_SECRET_PATH}"
echo "[ha-mcp add-on] listening on :${MCP_PORT} (streamable-http)"

# ha-mcp-web is the streamable-http transport: single path handles GET + POST.
exec ha-mcp-web
