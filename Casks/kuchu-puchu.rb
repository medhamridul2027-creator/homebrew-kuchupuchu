# Homebrew cask (published in the tap https://github.com/medhamridul2027-creator/homebrew-kuchupuchu as Casks/kuchu-puchu.rb).
# People run: brew tap medhamridul2027-creator/kuchupuchu && brew trust medhamridul2027-creator/kuchupuchu && brew install --cask kuchu-puchu
cask "kuchu-puchu" do
  version "0.17.0"
  sha256 "ccb9e8f7b2d29cc51f9eb499ba09e651ca6947b2ab95213e1bd74cd004051025"

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
