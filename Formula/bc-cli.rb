class BcCli < Formula
  desc "Butler Coffee CLI - Discover coffee knowledge and manage subscriptions from your terminal"
  homepage "https://github.com/ButlerCoffee/bc-cli"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ButlerCoffee/bc-cli/releases/download/v1.0.1/bc-cli-darwin-arm64"
      sha256 "2cd84819827631d6238a8ffc9f7ff1916dd1a6b4078835d45cce3598f9f13a7a" # ARM64
    else
      url "https://github.com/ButlerCoffee/bc-cli/releases/download/v1.0.1/bc-cli-darwin-amd64"
      sha256 "2abc2e52d25e980858c76edbd39832f7ad287d11cd8610e9e28c74cb81c95717" # AMD64
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "bc-cli-darwin-arm64" => "bc-cli"
    else
      bin.install "bc-cli-darwin-amd64" => "bc-cli"
    end
  end

  test do
    assert_match "bc-cli version", shell_output("#{bin}/bc-cli --version")
  end
end
