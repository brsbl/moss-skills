# Architecture Setup Reference

Read [../../WORKFLOWS.md](../../WORKFLOWS.md) first. Use this when workers or verification need a prepared app/runtime target.

## Prepared Environment Contract

Give each worker one dependency/runtime source:

- prepared checkout access
- manager-provided running app or URL
- linked `node_modules` from a prepared checkout

Workers should not run fresh installs/rebuilds by default.

## Access Report Snippet

```bash
pwd
git branch --show-current
git status --short
command -v rg || true
uname -m
node -p 'process.platform + " " + process.arch'
pnpm --version || true
test -e node_modules && echo node_modules-present || echo node_modules-missing
readlink node_modules || true
```

For Electron/Moss verification add:

```bash
file "$(command -v node)"
node -p 'process.versions.modules'
node -p "require.resolve('@electron-forge/cli/package.json')"
node -e 'console.log(require("electron"))'
```

## Link Root Dependencies When Approved

```bash
rm -rf node_modules
ln -s <prepared-checkout>/node_modules node_modules
```

## Environment Blockers

Treat these as tooling blockers until proven otherwise:

- missing `node_modules`, `rg`, package manager access, or package resolution
- Electron download/postinstall/runtime launch failures
- sandbox, permission, or CDP failures
- Node/esbuild/Electron/native package architecture mismatch
- missing long-lived app target or account state

The manager supplies a prepared target, fixes the environment, or asks the user. Do not report environment access failures as product defects.
