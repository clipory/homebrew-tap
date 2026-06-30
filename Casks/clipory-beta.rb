cask "clipory-beta" do
  version "1.1.0-beta.10"
  sha256 "7c4aad41f7af827867953a5f593dc7bc930024b45f99e621d24a0e2cae4041eb"

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
