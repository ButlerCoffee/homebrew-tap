class BcCli < Formula
  desc "Butler Coffee CLI - Discover coffee knowledge and manage subscriptions from your terminal"
  homepage "https://github.com/ButlerCoffee/bc-cli"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ButlerCoffee/bc-cli/releases/download/v1.0.0/bc-cli-darwin-arm64"
      sha256 "92c8f92e9e5efc92c55c24eac3e2aff5f7d413844768d9b6d028ac055976c3f5" # ARM64
    else
      url "https://github.com/ButlerCoffee/bc-cli/releases/download/v1.0.0/bc-cli-darwin-amd64"
      sha256 "de902b67650969f9a8f15d5859e3a7eb6e1989209aaa7270c27919ebf6e940ae" # AMD64
    end
  end

  def install
    bin.install "bc-cli-darwin-#{Hardware::CPU.arch}" => "bc-cli"
  end

  test do
    assert_match "bc-cli version", shell_output("#{bin}/bc-cli --version")
  end
end
