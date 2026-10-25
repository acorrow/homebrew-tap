class Zsplash < Formula
  desc "Lightweight CLI utility for colorful, expressive Zsh & terminal text (includes zsp alias)"
  homepage "https://github.com/acorrow/zsplash"
  url "https://github.com/acorrow/zsplash/archive/refs/tags/v0.6.3.tar.gz"
  sha256 "712989e5cec40d2ab8f60ecea0c5865c0207003e365cae5404e72c48efae9f3a"
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