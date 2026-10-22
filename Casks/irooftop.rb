cask "irooftop" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.0"
  sha256 arm:   "c7d080e96f9f720f2e376ec5a271a9dd9ac31d980caafb2f81fdb17890a52dd0",
         intel: "dd8d57890617b718bb8dcc21392d701d70fbaacb41fb9b28516ba5f75fbdaa49"

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
