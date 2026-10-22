cask "irooftop" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.0"
  sha256 arm:   "d0d3df479153ed63d5838520143755b8b7cbe7dcbd320d0dda6952135a985513",
         intel: "8e46dcdce7dde091adaf37540a0763613524647b991bbf4be47c250f0de40da1"

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
