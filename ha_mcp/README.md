# HA MCP Server (add-on)

Runs [`ha-mcp`](https://pypi.org/project/ha-mcp/) (streamable-http) inside Home
Assistant OS so Claude can control HA without depending on any external machine.

## What it does

- Starts `ha-mcp-web` on port `8765`, path = `secret_path`.
- Talks to Home Assistant at `homeassistant_url` with a long-lived token.
- The **secret path is the credential** (≈128-bit unguessable), because the
  Claude connector UI only accepts a URL — no custom headers. This mirrors the
  capability-URL model.

## Options

| Option | Default | Notes |
|---|---|---|
| `homeassistant_url` | `http://homeassistant:8123` | Reachable from inside HA OS. |
| `homeassistant_token` | _(empty)_ | Long-lived access token (Profile → Security). |
| `secret_path` | random | Keep secret. This is your auth. |

## Public URL

Behind a Cloudflare tunnel pointing at this add-on's port `8765`:

```
https://<your-domain><secret_path>
```

Paste that into Claude's "Add custom connector" → Remote MCP server URL.
