cask "irooftop" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "1797e23129ae67ae32cc757187c30f191c3e8dbf3c71223c5c8061809e07ca88",
         intel: "e6c01ec4ade828f5827b2f912c685ddb3c63d185f99c45bd316810b35e78d5c6"

  url "https://github.com/irooftop/rooftop/releases/download/v#{version}/iRoof.top_#{version}_#{arch}.dmg"
  name "iRoof.top"
  desc "Talk to the people you miss: continue a chat with an LLM in their style"
  homepage "https://iroof.top/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "iRoof.top.app"

  zap trash: [
    "~/Library/Application Support/top.iroof.desktop",
    "~/Library/Caches/top.iroof.desktop",
    "~/Library/Preferences/top.iroof.desktop.plist",
    "~/Library/Saved Application State/top.iroof.desktop.savedState",
    "~/Library/WebKit/top.iroof.desktop",
  ]

  caveats <<~EOS
    iRoof.top is not notarized by Apple yet. On the first launch, open it from
    Finder with right-click → Open, or allow it in System Settings → Privacy & Security.
  EOS
end
