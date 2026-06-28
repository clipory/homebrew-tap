cask "clipory-beta" do
  version "1.1.0-beta.1"
  sha256 "7a24e97113da4fc2b53f1846b5976c2d8cc26e088564cc224151c8518be78355"

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
