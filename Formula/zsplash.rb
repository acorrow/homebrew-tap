class Zsplash < Formula
  desc "Reactive CLI utility for colorful Zsh and terminal text"
  homepage "https://github.com/acorrow/zsplash"
  url "https://github.com/acorrow/zsplash/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "570d76243bad41b9d1cac6a617c8c265e1797e447c90dce5d9c9e9f6fb3521bb"
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
