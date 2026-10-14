class Occ < Formula
  desc "OTLP Cardinality Checker"
  homepage "https://github.com/fiddeb/occ"
  version "0.6.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fiddeb/occ/releases/download/v0.6.0/otlp_cardinality_checker-darwin-arm64.zip"
      sha256 "6fd4a7a935aa34f31f133ad3e682694c1e5a05a5ec9bea5f2964e55885a15a0e"
    else
      url "https://github.com/fiddeb/occ/releases/download/v0.6.0/otlp_cardinality_checker-darwin-amd64.zip"
      sha256 "ff51fcc389550284e092c7cd2548a47d6791bf6632614a7be3a3eb43bc1afac7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/fiddeb/occ/releases/download/v0.6.0/otlp_cardinality_checker-linux-arm64.tar.gz"
      sha256 "6684461815b5ff0e870a29fbb42a3242f678083ac89876a30b1eff50e59ad580"
    else
      url "https://github.com/fiddeb/occ/releases/download/v0.6.0/otlp_cardinality_checker-linux-amd64.tar.gz"
      sha256 "870e2b50ba6406d519e84835223811e6dc71e719652249cd7508122856c9af35"
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
