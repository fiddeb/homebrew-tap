class Occ < Formula
  desc "OTLP Cardinality Checker"
  homepage "https://github.com/fiddeb/occ"
  version "0.7.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fiddeb/occ/releases/download/v0.7.0/otlp_cardinality_checker-darwin-arm64.zip"
      sha256 "af7423f9a3a53dc6f72816eef8d7bd131a2c1625e49ac9ba5cdca5368da21b11"
    else
      url "https://github.com/fiddeb/occ/releases/download/v0.7.0/otlp_cardinality_checker-darwin-amd64.zip"
      sha256 "394808339b73fec8bf4a1e20d1ab83e5281d553a3f575ca62e08ba02379cdd2b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fiddeb/occ/releases/download/v0.7.0/otlp_cardinality_checker-linux-arm64.tar.gz"
      sha256 "762ee54c83259018a8b711c6f58b33f667d0761ac8cc9e9bfa487c0c49fa5f03"
    else
      url "https://github.com/fiddeb/occ/releases/download/v0.7.0/otlp_cardinality_checker-linux-amd64.tar.gz"
      sha256 "60589d350b1fe429ebd10f7211c1f93fb8e83de1f4d43a2ff02e40440989442d"
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
