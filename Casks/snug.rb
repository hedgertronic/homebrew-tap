# Snug: brew install --cask hedgertronic/tap/snug
# Snug's scripts/build.py --release writes the version and sha256 below for each new download.
cask "snug" do
  version "1.1.0"
  sha256 "e7e6e1b5edac266a6879318aba76b2668b9397e5f18b769610aa4be1319ab679"

  url "https://github.com/hedgertronic/snug/releases/download/v#{version}/Snug-#{version}.zip"
  name "Snug"
  desc "Screenshots that fit like a glove"
  homepage "https://snugshot.app/"

  livecheck do
    url "https://snugshot.app/appcast.xml"
    strategy :sparkle, &:short_version
  end

  # Snug updates itself with Sparkle.
  auto_updates true
  depends_on macos: :tahoe

  app "Snug.app"

  zap trash: [
    "~/Library/Application Support/Snug",
    "~/Library/Caches/com.hedgertronic.snug",
    "~/Library/Caches/Snug",
    "~/Library/HTTPStorages/com.hedgertronic.snug",
    "~/Library/Logs/Snug",
    "~/Library/Preferences/com.hedgertronic.snug.plist",
  ]
end
