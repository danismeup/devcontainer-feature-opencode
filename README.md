# devcontainer-feature-opencode

> **Dev Container Feature** that installs and configures [OpenCode](https://opencode.ai) in GitHub Codespaces.

## Features

- Installs OpenCode CLI (pinnable version or `latest`)
- Sets `OPENCODE_DATA_DIR` to `/workspaces/<repo>/.opencode/data` — **survives container rebuilds**
- Installs helper script `opencode-web-start` to launch the web UI with one command
- Optional automatic start of the web UI on Codespace creation
- Examples for minimal, Java, and .NET projects

## Usage

Add this to your `.devcontainer/devcontainer.json`:

```jsonc
{
  "features": {
    "ghcr.io/danismeup/devcontainer-feature-opencode/opencode:1": {
      "version": "latest",
      "webPort": "4096"
    }
  },
  "forwardPorts": [4096],
  "postStartCommand": "opencode-web-start &"
}
```

Add to your `.gitignore`:

```
.opencode/data/
.opencode/auth.json
```

## Options

| Option | Type | Default | Description |
|---|---|---|---|
| `version` | `string` | `latest` | OpenCode version to install (`latest` or semver, e.g. `0.3.12`) |
| `webPort` | `string` | `4096` | Port for the OpenCode web UI |
| `startWebOnCreate` | `boolean` | `false` | Auto-start web UI on container creation |
| `dataDirRelative` | `string` | `.opencode/data` | Path (relative to workspace) for OpenCode data |

## Persistence

OpenCode data (sessions, snapshots, logs) is stored under `/workspaces/<repo>/.opencode/data`. This path **survives container rebuilds** but is lost if the Codespace is deleted.

For permanent session history, commit the `data/` folder to a private repo or back it up externally.

## Web UI

Once the Codespace is running:

- The web UI is available at the forwarded port (e.g. `https://<codespace>-4096.app.github.dev`).
- To start manually: `opencode-web-start &`
- To attach CLI to the same session: `opencode attach http://localhost:4096`

## Examples

See [`examples/`](./examples/) for ready-to-use `.devcontainer/devcontainer.json` files:

- [`minimal/`](./examples/minimal/) — any language / universal image
- [`java-project/`](./examples/java-project/) — Java 21 + Maven
- [`dotnet-project/`](./examples/dotnet-project/) — .NET 9 / C#

## Development

Structure follows the [Dev Container Feature spec](https://containers.dev/implementors/features/):

```
src/opencode/
  devcontainer-feature.json   # Feature metadata and options
  install.sh                  # Installation script
test/opencode/
  test.sh                     # Feature smoke tests
  scenarios.json              # Test scenarios
examples/
  minimal/
  java-project/
  dotnet-project/
```

## License

MIT
