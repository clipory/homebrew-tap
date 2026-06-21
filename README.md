# homebrew-tap

A [Homebrew](https://brew.sh) tap for **[Clipory](https://clipory.app)** — a fast,
keyboard-first clipboard manager for macOS.

## Install

```sh
brew install --cask demiaochen/tap/clipory
```

That auto-taps this repo and installs the latest notarized `Clipory.app` into
`/Applications`. Updates are delivered **in-app by Sparkle** — `auto_updates true` tells
Homebrew to stay out of Sparkle's way, so `brew upgrade` won't fight it.

Prefer to tap explicitly first?

```sh
brew tap demiaochen/tap
brew install --cask clipory
```

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
