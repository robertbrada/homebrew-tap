cask "macaway" do
  version "1.3.0"
  sha256 "75e3df50d77b694fb0902118f26cf9ae54334f72467bc8510be67b5a1fa132a4"

  url "https://github.com/robertbrada/macaway-releases/releases/download/archives/MacAway-#{version}.zip"
  name "MacAway"
  desc "Lock the screen when your iPhone or Apple Watch moves away"
  homepage "https://macaway.app/"

  livecheck do
    url "https://macaway.app/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :ventura

  app "MacAway.app"

  uninstall quit: "app.macaway.mac"

  zap trash: [
    "~/Library/Caches/app.macaway.mac",
    "~/Library/HTTPStorages/app.macaway.mac",
    "~/Library/Preferences/app.macaway.mac.plist",
    "~/Library/WebKit/app.macaway.mac",
  ]
end
