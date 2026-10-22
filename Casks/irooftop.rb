cask "irooftop" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.0"
  sha256 arm:   "1b1055ed5d0cab6af9c0ae231435e1f7552c8fc1b95f20c416c3d8239ed727b4",
         intel: "13bb7f1e17bec1c927bf7a472d532a70a81ac33f02bad35a160d6394560935eb"

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
