class Causal < Formula
  desc "Local evidence-led investigation workspace"
  homepage "https://github.com/fiddeb/causal-releases"
  url "https://github.com/fiddeb/causal-releases/releases/download/v0.0.1/causal-v0.0.1-darwin-arm64.dmg"
  version "0.0.1"
  sha256 "bbce6b735a8340d242265bd00ea806bbcad959459281b0e000a365e034ac04d7"
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
    assert_match "v0.0.1", shell_output("#{bin}/causal --version")
  end
end
