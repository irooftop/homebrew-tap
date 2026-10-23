cask "irooftop" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.5"
  sha256 arm:   "40e0919430d747b23e1a6ad5bf47eff6971f5e47d001d49efba9f2d4c9fb6213",
         intel: "6a3566a3bdf497d5a79587b48c6dddd2962e1e725aa43403ad0ec8d4e85c4ee7"

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
