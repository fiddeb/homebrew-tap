class Causal < Formula
  desc "Local evidence-led investigation workspace"
  homepage "https://github.com/fiddeb/causal-releases"
  url "https://github.com/fiddeb/causal-releases/releases/download/v0.0.6/causal-v0.0.6-darwin-arm64.zip"
  version "0.0.6"
  sha256 "d079b41bfed654a351082b5b32a6e5fb06fc03c886f64637e42038a90e979bcf"
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
    assert_match "v0.0.6", shell_output("#{bin}/causal --version")
  end
end
