class Zsplash < Formula
  desc "Reactive CLI utility for colorful Zsh and terminal text"
  homepage "https://github.com/acorrow/zsplash"
  url "https://github.com/acorrow/zsplash/archive/refs/tags/v0.6.4.tar.gz"
  sha256 "a13c38d8f431b5ed19ea4e47edcf051aa7adfa19e7cbadb1fe3eda601d723fd8"
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
