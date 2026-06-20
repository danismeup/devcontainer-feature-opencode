# OpenCode Feature — Integration Notes

## Environment Variables Set

| Variable | Default | Description |
|---|---|---|
| `OPENCODE_DATA_DIR` | `/workspaces/<repo>/.opencode/data` | Where OpenCode stores sessions, snapshots and logs |
| `OPENCODE_WEB_PORT` | `4096` | Port read by `opencode-web-start` helper script |

## Helper Scripts Installed

- **`opencode-web-start`** — starts the web UI on `$OPENCODE_WEB_PORT`. Call it from `postStartCommand` or manually.

## Recommended devcontainer.json additions

```jsonc
{
  "forwardPorts": [4096],
  "postStartCommand": "opencode-web-start &"
}
```

## .gitignore

Add to your repo's `.gitignore`:

```
.opencode/data/
.opencode/auth.json
```

A snippet is also saved at `/usr/local/share/opencode-feature/gitignore-snippet.txt`.
