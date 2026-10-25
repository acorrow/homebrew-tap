class Zsplash < Formula
  desc "Reactive CLI utility for colorful Zsh and terminal text"
  homepage "https://github.com/acorrow/zsplash"
  url "https://github.com/acorrow/zsplash/archive/refs/tags/v0.6.9.tar.gz"
  sha256 "98f7d0df68242c44bacbe9080dd57653ab4fa597dac02ec64b014cf23597aa7b"
  license "MIT"
  head "https://github.com/acorrow/zsplash.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}")
    bin.install_symlink "zsplash" => "zsp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zsplash --version")
    assert_match version.to_s, shell_output("#{bin}/zsp --version")
  end
end
