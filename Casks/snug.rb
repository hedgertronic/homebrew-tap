# Snug: brew install --cask hedgertronic/tap/snug
# Snug's scripts/build.py --release writes the version and sha256 below for each new download.
cask "snug" do
  version "1.0.1"
  sha256 "1d2c2a632eaec045991929b9657b85fc2d2018b2e2390ef16888e6a1f6fd7755"

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
