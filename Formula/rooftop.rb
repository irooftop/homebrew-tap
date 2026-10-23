class Rooftop < Formula
  desc "Continue a Telegram or WhatsApp chat with an LLM that writes like the person"
  homepage "https://iroof.top/"
  url "https://github.com/irooftop/rooftop/archive/refs/tags/v0.5.6.tar.gz"
  sha256 "07ef39028a4eb820cdef5e6bcdf7c054b3adda5d8bda27559cab8fadb38ec442"
  license "MIT"
  head "https://github.com/irooftop/rooftop.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  service do
    run [opt_bin/"rooftop"]
    environment_variables ROOFTOP_DATA: var/"rooftop"
    working_dir var/"rooftop"
    keep_alive true
    log_path var/"log/rooftop.log"
    error_log_path var/"log/rooftop.log"
  end

  def caveats
    <<~EOS
      Open http://127.0.0.1:8080 after starting it, then set the model in Settings.
      As a background service: brew services start rooftop (data in #{var}/rooftop).
      Optional, to describe GIFs and videos from their frames: brew install ffmpeg
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rooftop --version")
    port = free_port
    pid = spawn({ "ROOFTOP_DATA" => testpath.to_s }, bin/"rooftop", "--addr", "127.0.0.1:#{port}")
    begin
      sleep 5
      assert_equal "ok", shell_output("curl -fsS http://127.0.0.1:#{port}/healthz")
    ensure
      Process.kill("TERM", pid)
      Process.wait(pid)
    end
  end
end
