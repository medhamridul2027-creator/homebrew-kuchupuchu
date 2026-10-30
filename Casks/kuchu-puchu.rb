cask "kuchu-puchu" do
  version "0.12.0"
  sha256 "c8782f357d9bfcd05f63ba4547a55ef920cb1eb9a469767685f89292017669a1"

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
  depends_on macos: ">= :sonoma"

  app "Kuchu Puchu Native.app"

  zap trash: [
    "~/Library/Application Support/com.kuchupuchu.native.studio",
    "~/Library/Preferences/com.kuchupuchu.native.studio.plist",
    "~/Library/Caches/com.kuchupuchu.native.studio",
  ]
end
