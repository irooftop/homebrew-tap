cask "irooftop" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.10"
  sha256 arm:   "e65b5f39760575f5d6976f77b41e68b24fe3d1440c7f90817f9019dc7dac345e",
         intel: "35e6236a395480d604898097ce3c674a66157b1e71ed21181614eb0e458dc2b1"

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
    https://irooftop.github.io/guide/unsigned-apps
  EOS
end
