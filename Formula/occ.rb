class Occ < Formula
  desc "OTLP Cardinality Checker"
  homepage "https://github.com/fiddeb/occ"
  version "0.6.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fiddeb/occ/releases/download/v0.6.1/otlp_cardinality_checker-darwin-arm64.zip"
      sha256 "0acaa29ed7b5d82563294057fc25f29fa6f77de0934688f065d094e3fb33f729"
    else
      url "https://github.com/fiddeb/occ/releases/download/v0.6.1/otlp_cardinality_checker-darwin-amd64.zip"
      sha256 "4a47e9438ed693e8bfaa3877174ac2c981f826ec0d6b7b22e7756bdb02da0d49"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fiddeb/occ/releases/download/v0.6.1/otlp_cardinality_checker-linux-arm64.tar.gz"
      sha256 "cfcff67b6616c65cebdbfa122f2c74a362b4eb004e2b86ca0128f19622eabbd7"
    else
      url "https://github.com/fiddeb/occ/releases/download/v0.6.1/otlp_cardinality_checker-linux-amd64.tar.gz"
      sha256 "e4c3291fddcb0bec35875b23d724e6725f1ff4f228a7964cc636e12a5e893d77"
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
