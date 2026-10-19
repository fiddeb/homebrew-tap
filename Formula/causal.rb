class Causal < Formula
  desc "Local evidence-led investigation workspace"
  homepage "https://github.com/fiddeb/causal-releases"
  url "https://github.com/fiddeb/causal-releases/releases/download/v0.0.4/causal-v0.0.4-darwin-arm64.zip"
  version "0.0.4"
  sha256 "78c0fd8609daaa4c77b826694e70269643e52eba388538714a7099e7bc7b42e7"
  license "MIT"
  depends_on :macos
  depends_on arch: :arm64

  def install
    odie "Causal requires macOS 27 or later" if MacOS.version < "27"
    bin.install "causal"
    pkgshare.install "LICENSE", "THIRD-PARTY-NOTICES.txt", "README.md",
                     "CLI-AND-RECOVERY.md", "BUILD.json", "VERIFY-INSTALL.sh"
  end

  def caveats
    <<~EOS
      Start Causal manually: causal serve
      Verify this installation on macOS 27:
        bash #{pkgshare}/VERIFY-INSTALL.sh #{bin}/causal "$PWD/causal-installation-report.json"
    EOS
  end

  test do
    assert_match "v0.0.4", shell_output("#{bin}/causal --version")
  end
end
