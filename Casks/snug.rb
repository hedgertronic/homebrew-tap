# Snug: brew install --cask hedgertronic/tap/snug
# Snug's scripts/build.py --release writes the version and sha256 below for each new download.
cask "snug" do
  version "1.0.0"
  sha256 "bba0158c6e0750731d0a1391d054f5c8be8971ab59278e3cc4b8dba5f0a9060c"

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
