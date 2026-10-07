class Occ < Formula
  desc "OTLP Cardinality Checker"
  homepage "https://github.com/fiddeb/occ"
  version "0.5.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fiddeb/occ/releases/download/v0.5.8/otlp_cardinality_checker-darwin-arm64.zip"
      sha256 "39e5c108ba258cfa179bc09f015cb4e6d456f2cc249e7387cd2d4f686610039d"
    else
      url "https://github.com/fiddeb/occ/releases/download/v0.5.8/otlp_cardinality_checker-darwin-amd64.zip"
      sha256 "f3a7d704600c9635dd54ed94722fe023a0c3bf82c16877cafc3bed98fbe1e083"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fiddeb/occ/releases/download/v0.5.8/otlp_cardinality_checker-linux-arm64.tar.gz"
      sha256 "abdb052c934b59843deb4b92693478dd1864a1356b1398c498f25c658afdcd85"
    else
      url "https://github.com/fiddeb/occ/releases/download/v0.5.8/otlp_cardinality_checker-linux-amd64.tar.gz"
      sha256 "d032b8f7ec5e797647a45b591793359d882652760a0375a1b6d9616c4e604ac6"
    end
  end

  def install
    platform = OS.mac? ? "darwin" : "linux"
    architecture = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "otlp_cardinality_checker-#{platform}-#{architecture}" => "occ"
  end

  test do
    assert_match "occ v#{version}", shell_output("#{bin}/occ --version")
  end
end
