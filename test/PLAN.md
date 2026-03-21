# Installer Test Plan

## Goal
Verify `bin/dots` works correctly on a fresh Linux environment without
breaking macOS, before merging the zsh rewrite from the WIP branch.

## Test Environment

Single `debian:bookworm-slim` container covers all cases:
- Small (~50MB with zsh + git)
- Has `apt-get` so the sh bootstrap preamble can be tested
- Close enough to Ubuntu behavior; no busybox tooling quirks

Two test modes within the same image:
- **with zsh pre-installed** → exercises the installer logic (zsh code path)
- **without zsh pre-installed** → exercises the sh preamble (`apt-get install zsh`)

macOS-specific steps (iTerm, Sublime Text) are skipped on Linux by design
and will continue to be tested manually on mac.

## File Layout

```
test/
  PLAN.md              ← this file
  Dockerfile           ← debian:bookworm-slim + test deps
  run.sh               ← build image, run all cases, report pass/fail
  cases/
    01-fresh-install.sh
    02-idempotent.sh
    03-conflict-backup.sh
    04-uninstall.sh
    05-bootstrap-mode.sh
    06-no-personalize.sh
```

## Test Cases

### 01 — Fresh install
**Setup:** empty HOME, repo cloned to `~/.dotfiles`
**Run:** `bin/dots --no-personalize`
**Assert:**
- every file in `dots/` (minus exclusions) is symlinked from HOME
- symlink targets are relative (`.dotfiles/dots/foo`)
- `~/bin` symlinks to `.dotfiles/bin`
- `~/.ssh/config` symlinks to `.dotfiles/dots/.ssh_config`
- `~/.vim/backups/` directory exists
- exit code 0

### 02 — Idempotent re-run
**Setup:** run 01 first
**Run:** `bin/dots --no-personalize` a second time
**Assert:**
- no new `.old` files created
- all symlinks unchanged
- exit code 0

### 03 — Conflict backup
**Setup:** place real files at `~/.zshrc`, `~/.profile`, `~/.gitconfig`
**Run:** `bin/dots --no-personalize`
**Assert:**
- originals moved to `~/.zshrc.old`, `~/.profile.old`, `~/.gitconfig.old`
- symlinks now in place at the original paths
- no `.old.old` files (idempotent backup)

### 04 — Uninstall
**Setup:** run 01 first
**Run:** `bin/dots --uninstall`
**Assert:**
- all managed symlinks removed
- `.old` backup files (if any) left untouched
- `~/.git-vars` and `~/.zcompdump` moved to `/tmp`
- `~/.ssh/config` symlink removed

### 05 — Bootstrap mode (piped)
**Setup:** empty HOME
**Run:** `cat bin/dots | zsh` (simulates `curl | zsh`)
**Assert:**
- `~/.git-vars` created (empty touch)
- "Run this command to complete setup" message printed
- no interactive prompts attempted

### 06 — No-personalize flag
**Setup:** empty HOME, no `GIT_AUTHOR_NAME` etc. in env
**Run:** `bin/dots --no-personalize`
**Assert:**
- no interactive prompts
- installer completes without waiting for input

## sh Bootstrap Preamble Test

Run in a separate container stage where zsh is NOT pre-installed:

**Run:** `sh bin/dots --no-personalize`
**Assert:**
- zsh gets installed via `apt-get`
- script re-execs under zsh and completes successfully

## Pass Criteria

All 6 cases + bootstrap preamble test exit 0 with no assertion failures.
`run.sh` should print a clear PASS/FAIL per case and a final summary.

## Out of Scope (for now)

- macOS-specific steps (iTerm, Sublime Text) — manual testing on mac
- `personalize_git_env` interactive prompts — covered by case 06 (skipped)
- Network-dependent steps (`clone_repo`, `install_git_friendly`) — stub or skip;
  tests mount the local repo directly rather than cloning from GitHub
