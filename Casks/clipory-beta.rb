cask "clipory-beta" do
  version "1.4.0-beta.9"
  sha256 "0a4637282c6779db76e308647a5ae23da12535a1a04a04c4e718a3e6a760cba0"

  url "https://dl.clipory.app/beta/Clipory-#{version}.dmg"
  name "Clipory (Beta)"
  desc "Fast, keyboard-first clipboard manager — beta channel"
  homepage "https://clipory.app/"

  # Version is read from the BETA Sparkle appcast that powers the app's own auto-updates.
  livecheck do
    url "https://dl.clipory.app/appcast-beta.xml"
    strategy :sparkle
  end

  auto_updates true          # Sparkle delivers beta updates in-app; keep brew out of its way
  depends_on macos: :sonoma  # macOS 14.0+, matching MACOSX_DEPLOYMENT_TARGET

  # Same bundle id as stable: installs IN PLACE over a stable Clipory and keeps its data.
  app "Clipory.app"

  # `brew uninstall --zap` wipes local app data. The Pro license lives in the macOS
  # Keychain and is intentionally NOT listed here, so a zap never destroys it.
  zap trash: [
    "~/Library/Application Support/Clipory",
    "~/Library/Caches/app.clipory.Clipory",
    "~/Library/HTTPStorages/app.clipory.Clipory",
    "~/Library/Preferences/app.clipory.Clipory.plist",
    "~/Library/Saved Application State/app.clipory.Clipory.savedState",
  ]
end
