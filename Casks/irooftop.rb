cask "irooftop" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.4"
  sha256 arm:   "76641b5c1d7391d4abc0ee6b1a8de8a794171ad8d2d8bf0954396d885f90cde7",
         intel: "209dfc34e1bcef98ee33efa36a582aca9d6c99bd8120a17ba698c99851b3c41a"

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
