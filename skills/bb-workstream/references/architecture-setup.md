# Architecture Setup Reference

Use one architecture for the whole worktree/session. On Apple Silicon, the default is native arm64 from Node through dependencies, esbuild, Electron, and native packages. Run this before assigning workers or running verification:

```bash
cat > /tmp/moss-arm64-dev-setup.sh <<'SH'
set -euo pipefail

echo "machine: $(uname -m)"
echo "node: $(node -p 'process.platform + " " + process.arch')"
file "$(command -v node)"

test "$(node -p 'process.arch')" = "arm64" || {
  echo "Expected arm64 Node. Switch to native arm64 Node before installing dependencies."
  exit 1
}

rm -rf node_modules packages/*/node_modules

env -u NODE_ENV pnpm install --frozen-lockfile --config.production=false
pnpm rebuild --pending esbuild electron
node node_modules/electron/install.js

node -e 'console.log("node", process.arch); console.log("electron", require("electron")); console.log("esbuild", require("esbuild").version)'
SH

arch -arm64 zsh /tmp/moss-arm64-dev-setup.sh
```

If the session is intentionally all-Rosetta/x64, create and run the x64 variant instead:

```bash
sed -e 's/= "arm64"/= "x64"/' \
  -e 's/Expected arm64 Node. Switch to native arm64 Node/Expected x64 Node. Switch to Rosetta x64 Node/' \
  /tmp/moss-arm64-dev-setup.sh > /tmp/moss-x64-dev-setup.sh
arch -x86_64 zsh /tmp/moss-x64-dev-setup.sh
```

Simple rules:

- Check Node architecture before installing dependencies.
- Never reuse `node_modules` after switching architecture.
- Reinstall/rebuild before assigning workers or running verification.
- If setup fails, record an environment/tooling blocker and fix setup before continuing.

Before launching Electron or running screenshot/user-flow checks, record:

```bash
uname -m
node -p 'process.platform + " " + process.arch'
file "$(command -v node)"
node -p 'process.versions.modules'
node -e 'console.log(require("electron"))'
```

Missing `node_modules`, missing `rg`, unavailable package-manager access, Electron download/postinstall failures, Electron launch failures, sandbox or permission failures, CDP failures, and Node/esbuild/Electron/native-package architecture mismatches are environment/tooling blockers. The manager either bootstraps the environment, supplies a prepared/shared environment, provides a running app or URL for verification, or asks the user. Do not let a worker treat these access failures as product defects or proceed with acceptance-critical checks missing.
