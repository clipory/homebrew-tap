# homebrew-tap

A [Homebrew](https://brew.sh) tap for **[Clipory](https://clipory.app)** — a fast,
keyboard-first clipboard manager for macOS.

## Install

```sh
brew install --cask clipory/tap/clipory
```

That auto-taps this repo and installs the latest notarized `Clipory.app` into
`/Applications`. Updates are delivered **in-app by Sparkle** — `auto_updates true` tells
Homebrew to stay out of Sparkle's way, so `brew upgrade` won't fight it.

Prefer to tap explicitly first?

```sh
brew tap clipory/tap
brew install --cask clipory
```

## Update

Clipory updates **itself** via its built-in Sparkle updater — a daily background check (on by
default) plus **Clipory ▸ Check for Updates…** in the app. An app installed with Homebrew is
the same notarized build, so it stays current automatically; most users never run an update
command.

Because the cask is marked `auto_updates true`, plain `brew upgrade` intentionally **skips**
Clipory (so Homebrew and Sparkle don't fight over it). To force an update through Homebrew
anyway:

```sh
brew upgrade --cask --greedy clipory
```

The `--greedy` flag is required — it's what tells `brew` to include self-updating casks.

## Uninstall

```sh
brew uninstall --cask clipory          # remove the app
brew uninstall --zap --cask clipory    # also remove preferences / caches / local history
```

> Your Pro license is stored in the macOS **Keychain** and is intentionally left untouched
> by `--zap`.

## Requirements

- macOS 14.0 (Sonoma) or later.
- Homebrew (`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`).
