cask "macaway" do
  version "1.3.1"
  sha256 "61f2cc32cdf51954c29ed3e7db7ff319deaa6aeb9cf55294630713e3f7ce79db"

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
