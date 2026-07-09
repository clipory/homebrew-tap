cask "clipory" do
  version "1.2.0"
  sha256 "f1cc6c9dca86e166909b3f7517ec10e4b997be406e7f0229e8689201b3ddd26b"

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
