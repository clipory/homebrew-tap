cask "clipory" do
  version "1.0.6"
  sha256 "a814fac46d584d1eda6a57207bfabd92356f893e0fbbc5d95b8f4d673dcd8187"

  url "https://dl.clipory.app/Clipory-#{version}.dmg"
  name "Clipory"
  desc "Fast, keyboard-first clipboard manager"
  homepage "https://clipory.app/"

  # Version is read from the Sparkle appcast that powers the app's own auto-updates.
  livecheck do
    url "https://dl.clipory.app/appcast.xml"
    strategy :sparkle
  end

  auto_updates true          # Sparkle delivers updates in-app; keep brew out of its way
  depends_on macos: :sonoma  # macOS 14.0+, matching MACOSX_DEPLOYMENT_TARGET

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
