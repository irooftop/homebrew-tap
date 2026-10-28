cask "irooftop" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.9"
  sha256 arm:   "9323b781e35ff95bf03ce2495abd1faa6da3cb8aeba4dd53a4220921c0f58be1",
         intel: "16aa2f024850ce3055045e5097c4017eaf0db89835320ac8ca7353a2b962966a"

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
