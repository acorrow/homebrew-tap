class Zsplash < Formula
  desc "Lightweight CLI utility for colorful, expressive Zsh & terminal text (includes zsp alias)"
  homepage "https://github.com/acorrow/zsplash"
  url "https://github.com/acorrow/zsplash/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "b67f6995b672592a050c1078d66f5e6556dc6df572f3883a16851494a2d94205"
  license "MIT"
  head "https://github.com/acorrow/zsplash.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}")
    bin.install_symlink "zsplash" => "zsp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zsplash --version")
    assert_match version.to_s, shell_output("#{bin}/zsp --version")
  end
end