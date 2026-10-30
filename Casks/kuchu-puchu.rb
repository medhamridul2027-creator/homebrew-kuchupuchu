cask "kuchu-puchu" do
  version "0.13.0"
  sha256 "cbd8e89f72548ffb765e05d720d55248f853ef90830c15d023190ffc5ce48bb5"

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

  app "Kuchu Puchu Native.app"

  zap trash: [
    "~/Library/Application Support/com.kuchupuchu.native.studio",
    "~/Library/Caches/com.kuchupuchu.native.studio",
    "~/Library/Preferences/com.kuchupuchu.native.studio.plist",
  ]
end
