cask "irooftop" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.3"
  sha256 arm:   "4bf8d9c08f1713971817b6881eeadaf25f856e47d4b99f450cdbbbbf135980fe",
         intel: "b62bb9a3c2dd1ad8a7c786d71312a5af18b9e5c2d5ef98bc31c4d4fd3e70b7da"

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
    iRoof.top is not notarized by Apple yet. Open it once, then allow it in
    System Settings → Privacy & Security → Open Anyway. Step by step:
    https://irooftop.github.io/rooftop/guide/unsigned-apps
  EOS
end
