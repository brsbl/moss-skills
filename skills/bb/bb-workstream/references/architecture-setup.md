# Architecture Setup Reference

Use one architecture for the whole workstream. On Apple Silicon, the default is native arm64 from Node through dependencies, esbuild, Electron, and native packages.

The manager bootstraps dependencies once in a prepared source checkout, usually the main or integration checkout. Do not run this setup from fresh worker worktrees. Workers should receive one of:

- access to the prepared checkout
- a running app or URL
- a worker worktree with `node_modules` linked to the prepared dependency source

Manager/prepared-checkout bootstrap:

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

- Managers check Node architecture before installing dependencies in the prepared source checkout.
- Never reuse `node_modules` after switching architecture.
- If architecture changes, rebuild the prepared dependency source. Do not make each fresh worker worktree run its own install/rebuild/Electron postinstall.
- If setup fails, record an environment/tooling blocker and fix the prepared source before assigning workers or running verification.

Fresh worker worktrees do not run fresh `pnpm install`, `pnpm rebuild`, or `node node_modules/electron/install.js` by default. Use a prepared environment, a running app or URL, or link root dependencies from the prepared checkout:

```bash
rm -rf node_modules
ln -s <prepared-checkout>/node_modules node_modules
```

Before launching Electron or running screenshot/user-flow checks, record architecture and package resolution from the checkout that will run the app:

```bash
uname -m
node -p 'process.platform + " " + process.arch'
file "$(command -v node)"
node -p 'process.versions.modules'
test -e node_modules
readlink node_modules || true
node -p "require.resolve('@electron-forge/cli/package.json')"
node -e 'console.log(require("electron"))'
```

Missing `node_modules`, missing `rg`, unavailable package-manager access, Electron download/postinstall failures, Electron launch failures, sandbox or permission failures, CDP failures, package resolution failures, and Node/esbuild/Electron/native-package architecture mismatches are environment/tooling blockers. The manager either rebuilds the prepared dependency source, supplies a prepared/shared environment, provides a running app or URL for verification, links worker dependencies to the prepared checkout, or asks the user. Do not let a worker treat these access failures as product defects or proceed with acceptance-critical checks missing.
