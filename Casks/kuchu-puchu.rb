cask "kuchu-puchu" do
  version "0.15.1"
  sha256 "f41ecbc0247da2e263391f67f54d2eee515eed3ab4d824704e10a7937d7a46ed"

  url "https://kuchupuchu.me/Kuchu-Puchu-Mac-#{version}.dmg"
  name "Kuchu Puchu"
  desc "Little companions that wave, hug and send sparks from your friends"
  homepage "https://kuchupuchu.me/"

  livecheck do
    url "https://kuchupuchu.me/updates.json"
    strategy :json do |json|
      json["platforms"]["macos"]["version"]
    end
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Kuchu Puchu.app"

  zap trash: [
    "~/Library/Application Support/com.kuchupuchu.native.studio",
    "~/Library/Caches/com.kuchupuchu.native.studio",
    "~/Library/Preferences/com.kuchupuchu.native.studio.plist",
  ]
end
