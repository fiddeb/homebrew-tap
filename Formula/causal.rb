class Causal < Formula
  desc "Local evidence-led investigation workspace"
  homepage "https://github.com/fiddeb/causal-releases"
  url "https://github.com/fiddeb/causal-releases/releases/download/v0.0.11/causal-v0.0.11-darwin-arm64.zip"
  version "0.0.11"
  sha256 "2a2017784c3da32b1c4836b33e5d540817a883d7558b72bf04eb39eb1d6e9894"
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
    assert_match "v0.0.11", shell_output("#{bin}/causal --version")
  end
end
