class Zsplash < Formula
  desc "Reactive CLI utility for colorful Zsh and terminal text"
  homepage "https://github.com/acorrow/zsplash"
  url "https://github.com/acorrow/zsplash/archive/refs/tags/v0.6.8.tar.gz"
  sha256 "6c192a74e7c27c7b52c58cbdb8ab1e58ee0d509fda48b7786350e20d4b72bf3d"
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
