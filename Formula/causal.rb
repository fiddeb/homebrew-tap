class Causal < Formula
  desc "Local evidence-led investigation workspace"
  homepage "https://github.com/fiddeb/causal-releases"
  url "https://github.com/fiddeb/causal-releases/releases/download/v0.0.3/causal-v0.0.3-darwin-arm64.zip"
  version "0.0.3"
  sha256 "46e0e2b91b13ea80f7405d1f9127f6e3f3316d593da6811995ad38274262c98f"
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
    assert_match "v0.0.3", shell_output("#{bin}/causal --version")
  end
end
